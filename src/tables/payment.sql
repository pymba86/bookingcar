CREATE TABLE payment
(
  id          NUMBER(10)          NOT NULL PRIMARY KEY,
  order_id    NUMBER(10)          NOT NULL,
  status      NUMBER(1) DEFAULT 0 NOT NULL,
  price       NUMBER              NOT NULL,
  date_create DATE                NOT NULL,

  CONSTRAINT payment_order_id_fk FOREIGN KEY (order_id) REFERENCES orders (id),
  CONSTRAINT payment_check_price CHECK (price >= 0),
  CONSTRAINT payment_check_status CHECK (status IN (0, 1))
);

-- Создание последовательности для суррогатного ключа,таблицы "Платеж"
CREATE SEQUENCE payment_seq;

-- Создание индекса на "order_id"
CREATE INDEX payment_order_id_ldx
  ON payment (order_id);

-- Создание триггера на авто инкремент и добавление даты
CREATE TRIGGER payment_trg
BEFORE INSERT ON payment
FOR EACH ROW
  BEGIN
    :new.id := payment_seq.nextval;
  END;
/