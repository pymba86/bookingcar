/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Платеж"
CREATE TABLE payment
(
  id          NUMBER(10) NOT NULL PRIMARY KEY,
  order_id    NUMBER(10) NOT NULL,
  status_id   NUMBER(10) NOT NULL,
  category_id NUMBER(10) NOT NULL,
  price       NUMBER(6)  NOT NULL,
  date_create DATE       NOT NULL,

  CONSTRAINT payment_order_id_fk FOREIGN KEY (order_id) REFERENCES orders (id),
  CONSTRAINT payment_category_id_fk FOREIGN KEY (category_id) REFERENCES payment_category (id),
  CONSTRAINT payment_status_id_fk FOREIGN KEY (status_id) REFERENCES payment_status (id),
  CONSTRAINT payment_check_price CHECK (price >= 0)
);

-- Создание последовательности для суррогатного ключа,таблицы "Платеж"
CREATE SEQUENCE payment_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER payment_trg
BEFORE INSERT ON payment
FOR EACH ROW
  BEGIN
    :new.id := payment_seq.nextval;
  END;
