/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Клиент"
CREATE TABLE customer
(
  id            NUMBER(10)    NOT NULL PRIMARY KEY,
  name          VARCHAR2(100) NOT NULL,
  phone         VARCHAR2(11)  NOT NULL,
  email         VARCHAR2(100) NOT NULL,
  -- Паспортные данные
  -- TODO Добавить остальные поля по паспорту
  birthday      DATE          NOT NULL,
  -- Водительское удостоверение
  -- TODO Добавить остальные поля по удостоверению
  date_dlicense DATE          NOT NULL,

  -- Валидация номера телефона
  CONSTRAINT chk__customer_phone CHECK (length(phone) = 11 AND
                                        regexp_like(phone, '^[[:digit:]]{11}$')),
  -- Валидация почты
  CONSTRAINT chk_customer_email CHECK (regexp_like(email, '^\w+(\.\w+)*+@\w+(\.\w+)+$'))
);

-- Создание последовательности для суррогатного ключа,таблицы "Клиент"
CREATE SEQUENCE customer_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER customer_tgr
BEFORE INSERT ON customer
  BEGIN
    :new.id := customer_seq.nextval;
  END;