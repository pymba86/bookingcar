/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Тип коробки передач"
CREATE TABLE car_gearbox_type
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  description VARCHAR2(255) NOT NULL
);

-- Создание последовательности для суррогатного ключа,
-- таблицы "Тип коробки передач"
CREATE SEQUENCE car_gearbox_type_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_gearbox_type_trg
BEFORE INSERT ON car_gearbox_type
FOR EACH ROW
  BEGIN
    :new.id := car_gearbox_type_seq.nextval;
  END;

-- Заполнение данными таблицы "Тип коробки передач"
INSERT INTO car_gearbox_type (description) VALUES ('АКПП');
INSERT INTO car_gearbox_type (description) VALUES ('МКПП');
