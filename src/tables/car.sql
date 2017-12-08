/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Машина"
CREATE TABLE car
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  customer_id NUMBER(10)    NOT NULL,
  name        VARCHAR2(100) NOT NULL,

  CONSTRAINT car_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer (id)
);

-- Создание последовательности для суррогатного ключа,таблицы "Машина"
CREATE SEQUENCE car_seq;

-- Заполнение данными таблицы "Счет"
INSERT INTO car VALUES (1, 1, 'Volvo S40');
