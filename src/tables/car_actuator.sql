CREATE TABLE car_actuator
(
  id   NUMBER(10)    NOT NULL PRIMARY KEY,
  name VARCHAR2(255) NOT NULL
);

-- Создание последовательности для суррогатного ключа,таблицы "Тип привода"
CREATE SEQUENCE car_actuator_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_actuator_trg
BEFORE INSERT ON car_actuator
FOR EACH ROW
  BEGIN
    :new.id := car_actuator_seq.nextval;
  END;
/
-- Заполнение данными таблицы "Тип привода"
INSERT INTO car_actuator (name) VALUES ('Передний');
INSERT INTO car_actuator (name) VALUES ('Задний');
INSERT INTO car_actuator (name) VALUES ('Полный');