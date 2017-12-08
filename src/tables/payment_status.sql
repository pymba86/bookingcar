/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Статус счета"
CREATE TABLE payment_status
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  code        VARCHAR2(6)   NOT NULL,
  description VARCHAR2(100)
);

-- Создание последовательности для суррогатного ключа,таблицы "Статус оплаты"
CREATE SEQUENCE payment_status_seq;

-- Заполнение данными таблицы "Счет"
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'OP', 'оплачен');
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'NP', 'не оплачен');

