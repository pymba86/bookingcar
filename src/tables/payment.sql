/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Платеж"
CREATE TABLE payment
(
  id          NUMBER(10) NOT NULL PRIMARY KEY,
  order_id NUMBER(10) NOT NULL,
  status_id   NUMBER(10) NOT NULL,
  category_id NUMBER(10) NOT NULL,
  price       NUMBER(6)  NOT NULL,
  date_create DATE       NOT NULL

  CONSTRAINT payment_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer (id),
  CONSTRAINT payment_category_id_fk FOREIGN KEY (category_id) REFERENCES payment_category (id),
  CONSTRAINT payment_status_id_fk FOREIGN KEY (status_id) REFERENCES payment_status (id)
);

-- Создание последовательности для суррогатного ключа,таблицы "Счет"
CREATE SEQUENCE payment_seq;

-- Заполнение данными таблицы "Счет"
INSERT INTO payment VALUES (payment_seq.nextval, 1, 1, 1, 2800, SYSDATE, 'Оплата за аренду автомобиля');