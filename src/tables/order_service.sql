CREATE TABLE order_service
(
  id         NUMBER(10) NOT NULL PRIMARY KEY,
  order_id   NUMBER(10) NOT NULL,
  service_id NUMBER(10) NOT NULL,
  CONSTRAINT order_service_order_id_fk FOREIGN KEY (order_id) REFERENCES orders (ID),
  CONSTRAINT order_service_service_id_fk FOREIGN KEY (service_id) REFERENCES service (ID)
);

-- Создание последовательности для суррогатного ключа,таблицы "Выбранные услуги в заказе"
CREATE SEQUENCE order_service_seq;
-- Создание триггера на авто инкремент
CREATE TRIGGER order_service_trg
BEFORE INSERT ON order_service
FOR EACH ROW
  BEGIN
    :new.id := order_service_seq.nextval;
  END;
/
CREATE TRIGGER service_payment_trg
AFTER INSERT ON order_service
FOR EACH ROW
  DECLARE
    price_service service.price%TYPE;
  BEGIN
    -- Получаем ценник
    SELECT price
    INTO price_service
    FROM service
    WHERE id = :new.service_id;
   -- Вставить новый платеж
    INSERT INTO payment (order_id,price, date_create)
    VALUES (:new.order_id, price_service, SYSDATE);
  END;
/