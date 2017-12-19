/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание справочной таблицы "Локация"
CREATE TABLE location
(
  id      NUMBER(10) PRIMARY KEY NOT NULL,
  name    VARCHAR2(100)          NOT NULL,
  address VARCHAR2(255)          NOT NULL,
  phone   VARCHAR2(11),

  -- Валидация номера телефона
  CONSTRAINT chk__location_phone CHECK (length(phone) = 11 AND
                                        regexp_like(phone, '^[[:digit:]]{11}$'))
);

-- Создание последовательности для суррогатного ключа,таблицы "Локация"
CREATE SEQUENCE location_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER location_trg
BEFORE INSERT ON location
FOR EACH ROW
  BEGIN
    :new.id := location_seq.nextval;
  END;

-- Заполнение данными таблицы "Локация"
INSERT INTO location(name,
                     address,
                     phone) VALUES ('Альфа', 'ул.Гагарина д.25', '89324360407');

INSERT INTO location(name,
                     address,
                     phone) VALUES ('Бета', 'ул.Калиниа д.11', '89505318896');