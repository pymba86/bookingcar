CREATE TRIGGER order_trg
BEFORE INSERT ON orders
FOR EACH ROW
  BEGIN

    -- Общая проверка на время бронирования
    IF :new.date_start >= :new.date_end
    THEN
      RAISE_APPLICATION_ERROR(20002, 'Время бронирования указаны не правильно');
    END IF;

    -- Проверить срок аренды
    IF NOT cars.access(:new.car_id, :new.date_start, :new.date_end)
    THEN
      RAISE_APPLICATION_ERROR(20001, 'Машина забранирована на это время');
    END IF;

    -- Проверить на неоплаченные счета
    IF payments.amount(:new.customer_id, 2) > 0
    THEN
      RAISE_APPLICATION_ERROR(20000, 'У клиента есть не оплаченные счета');
    END IF;

    -- Увеличиваем id
    :NEW.id := orders_seq.nextval;
  END;
  /
CREATE TRIGGER order_payment_trg
AFTER INSERT ON orders
FOR EACH ROW
  DECLARE
    price_car car.price%TYPE;
  BEGIN
    -- Получаем ценник на машину
    SELECT price
    INTO price_car
    FROM car
    WHERE id = :new.car_id;

    -- Вставить новый платеж на машину
    INSERT INTO payment (order_id, price, date_create)
    VALUES (:new.id, TRUNC(:new.date_end - :new.date_start) * price_car, SYSDATE);
  END;
  /