/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Заказ"
CREATE TABLE order
(
  id                   NUMBER(10) NOT NULL PRIMARY KEY,
  customer_id          NUMBER(10) NOT NULL,
  car_id               NUMBER(10) NOT NULL,
  status_id            NUMBER(10) NOT NULL,
  -- дата создание заказа
  date_create          DATE       NOT NULL,
  -- срок аренды
  date_start           DATE       NOT NULL,
  date_end             DATE       NOT NULL,

  CONSTRAINT order_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer (ID),
  CONSTRAINT order_car_id_fk FOREIGN KEY (car_id) REFERENCES car (id)
);

-- Информация по заказу
CREATE VIEW order_info AS
  SELECT
    customer.name,
    car.name,
    order.date_start,
    order.date_end
  FROM order, customer, car
  WHERE customer.id = order.client_id
        AND car.id = order.car_id;

-- Валидация на добавление/обновление заявки
CREATE TRIGGER order_validate_tg
BEFORE INSERT OR UPDATE
  ON order
  BEGIN

    -- Проверить на то что дата начало не должна быть меньше текущей
    IF (:NEW.date_start < SYSDATE) AND (:NEW.date_end > :NEW.date_start)
    THEN
      raise_application_error
      (-20000
      , 'Заявка не может быть создана: время бронирования указано не правильно'
      );

      -- Проверить есть ли у него не оплаченные счета
    END IF;
    IF payments.amount(:NEW.client_id) > 0
    THEN
      RAISE_APPLICATION_ERROR(
      −20001,
      'Заявка не может быть создана: у клиента есть не оплаченные счета'
      );
    END IF;

    -- Проверить на попадает ли на другой диапазон
    IF orders.check(:NEW.car_id, :NEW.date_start, :NEW.date_end)
    THEN
      raise_application_error
      (-20000
      , 'Заявка не может быть создана: машина уже забранирована в это время'
      );
    END IF;

    -- Добавление / Обновление счета
    CASE
      WHEN INSERTING
      THEN
        -- Добавляем счет на оплату
        car_price := orders.calculate(car_id, date_start, date_end);
        --TODO Доделать добавить категорию
        INSERT INTO payment(customer_id_id, price) VALUES (NEW.customer_id,car_price);
      WHEN UPDATING
      THEN
        raise_application_error
      (-20004
      , 'Заявка не может быть обновлена. Отмените и создайте новую'
      );
    END CASE;

  END;

                          