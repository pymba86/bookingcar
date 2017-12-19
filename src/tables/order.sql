/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Заказ"
CREATE TABLE orders
(
  id          NUMBER(10) NOT NULL PRIMARY KEY,
  customer_id NUMBER(10) NOT NULL,
  car_id      NUMBER(10) NOT NULL,
  status_id   NUMBER(10) NOT NULL,
  -- дата создание заказа
  date_create DATE       NOT NULL,
  -- срок аренды
  date_start  DATE       NOT NULL,
  date_end    DATE       NOT NULL,

  CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer (ID),
  CONSTRAINT orders_car_id_fk FOREIGN KEY (car_id) REFERENCES car (id)
  -- TODO Добавить в триггер https://stackoverflow.com/questions/5332562/using-date-in-a-check-constraint-oracle
  -- CONSTRAINT orders_check_date_start CHECK (date_start >= SYSDATE),
  -- CONSTRAINT orders_check_date_end CHECK (date_end >= date_start),
  -- CONSTRAINT orders_check_date_create CHECK (date_create <= date_start)
);

CREATE SEQUENCE order_status_seq;
-- Создание триггера на авто инкремент
CREATE TRIGGER order_status_trg
BEFORE INSERT ON order_status
FOR EACH ROW
  BEGIN
    :new.id := order_status_seq.nextval;
  END;


-- TODO Информация по заказу - Понять как работать с этим
CREATE VIEW order_info AS
  SELECT
    customer.name,
    car.name,
    order.date_start,
    order.date_end
  FROM order, customer, car
  WHERE customer.id = order.client_id
        AND car.id = order.car_id;

-- Триггер на добавление/обновление заявки
CREATE TRIGGER order_trg
BEFORE INSERT OR UPDATE
  ON order
  BEGIN
    -- Проверить есть ли у него не оплаченные счета
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
        INSERT INTO payment (customer_id_id, price) VALUES (NEW.customer_id, car_price);
      WHEN UPDATING
      THEN
        raise_application_error
        (-20004
        , 'Заявка не может быть обновлена. Отмените и создайте новую'
        );
    END CASE;

  END;

                          