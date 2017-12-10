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

-- Создание последовательности для суррогатного ключа,таблицы "Услуга"
CREATE SEQUENCE service_seq;

-- Заполнение данными таблицы "Услуга"
INSERT INTO service VALUES ('OP', 'оплачен');

