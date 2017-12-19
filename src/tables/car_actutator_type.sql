/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Тип привода"
CREATE TABLE car_actuator_type
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  description VARCHAR2(255) NOT NULL
);

-- Создание последовательности для суррогатного ключа,таблицы "Тип привода"
CREATE SEQUENCE car_actuator_type_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_actuator_type_trg
BEFORE INSERT ON car_actuator_type
FOR EACH ROW
  BEGIN
    :new.id := car_actuator_type_seq.nextval;
  END;

-- Заполнение данными таблицы "Тип привода"
INSERT INTO car_actuator_type (description) VALUES ('Передний');
INSERT INTO car_actuator_type (description) VALUES ('Задний');
INSERT INTO car_actuator_type (description) VALUES ('Полный');