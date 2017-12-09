/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Выбранные услуги в заказе"
CREATE TABLE order_service
(
  id         NUMBER(10) NOT NULL PRIMARY KEY,
  order_id   NUMBER(10) NOT NULL,
  service_id NUMBER(10) NOT NULL
);

-- Создание последовательности для суррогатного ключа,таблицы "Статус оплаты"
CREATE SEQUENCE payment_status_seq;

-- Заполнение данными таблицы "Счет"
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'OP', 'оплачен');
INSERT INTO payment_status VALUES (payment_status_seq.nextval, 'NP', 'не оплачен');

