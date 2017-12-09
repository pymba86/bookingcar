/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Услуга"
CREATE TABLE service
(
  id          NUMBER(10)     NOT NULL PRIMARY KEY,
  name        VARCHAR2(255)  NOT NULL,
  description VARCHAR2(4000) NOT NULL,
  price       NUMBER         NOT NULL
);

-- Создание последовательности для суррогатного ключа,таблицы "Статус оплаты"
CREATE SEQUENCE payment_status_seq;

-- Заполнение данными таблицы "Счет"
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'OP', 'оплачен');
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'NP', 'не оплачен');

