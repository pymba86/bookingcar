/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Статус заказа"
CREATE TABLE order_status
(
  id          NUMBER(10) NOT NULL PRIMARY KEY,
  description VARCHAR2(100)
);

-- Создание последовательности для суррогатного ключа,таблицы "Статус заказа"
CREATE SEQUENCE order_status_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER order_status_trg
BEFORE INSERT ON order_status
FOR EACH ROW
  BEGIN
    :new.id := order_status_seq.nextval;
  END;

-- Заполнение данными таблицы "Статус заказа"
INSERT INTO order_status (description) VALUES ('Сформирован');
INSERT INTO order_status (description) VALUES ('Ожидание оплаты');

