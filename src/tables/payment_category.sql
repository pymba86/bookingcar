/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Категория счета"
CREATE TABLE payment_category
(
  id          NUMBER(10)  NOT NULL PRIMARY KEY,
  code        VARCHAR2(6) NOT NULL,
  description VARCHAR2(100)
);

-- Создание последовательности для суррогатного ключа,таблицы "Категория счета"
CREATE SEQUENCE payment_category_seq;

-- Заполнение данными таблицы "Категория счета"
INSERT INTO payment_status VALUES (payment_category_seq.nextval, 'CAR', 'Машина');
INSERT INTO payment_status VALUES (payment_category_seq.nextval, 'OPTION', 'Опция');
INSERT INTO payment_status VALUES (payment_category_seq.nextval, 'FINE', 'Штраф');
INSERT INTO payment_status VALUES (payment_category_seq.nextval, 'OTHER', 'Другое');

