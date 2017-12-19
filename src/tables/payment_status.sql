/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Статус счета"
CREATE TABLE payment_status
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  description VARCHAR2(100)
);

-- Создание последовательности для суррогатного ключа,таблицы "Статус счета"
CREATE SEQUENCE payment_status_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER payment_status_trg
BEFORE INSERT ON payment_status
FOR EACH ROW
  BEGIN
    :new.id := payment_status_seq.nextval;
  END;

-- Заполнение данными таблицы "Статус счета"
INSERT INTO payment_status(description) VALUES ('Оплачен');
INSERT INTO payment_status(description) VALUES ('Не оплачен');

