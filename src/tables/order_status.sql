/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Статус заказа"
CREATE TABLE order_status
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  code        VARCHAR2(6)   NOT NULL,
  description VARCHAR2(100)
);

-- Создание последовательности для суррогатного ключа,таблицы "Статус оплаты"
CREATE SEQUENCE payment_status_seq;

-- Заполнение данными таблицы "Счет"
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'SF', 'Сформирован');
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'OG', 'Ожидание оплаты');

