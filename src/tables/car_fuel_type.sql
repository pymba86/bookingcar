/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание справочной таблицы "Тип топлива"
CREATE TABLE car_fuel_type
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  description VARCHAR2(255) NOT NULL
);

-- Создание последовательности для суррогатного ключа,таблицы "Тип топлива"
CREATE SEQUENCE car_fuel_type_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_fuel_type_trg
BEFORE INSERT ON car_fuel_type
FOR EACH ROW
  BEGIN
    :new.id := car_fuel_type_seq.nextval;
  END;

-- Заполнение данными таблицы "Тип топлива"
INSERT INTO car_fuel_type (description) VALUES ('АИ92');
INSERT INTO car_fuel_type (description) VALUES ('АИ95');
