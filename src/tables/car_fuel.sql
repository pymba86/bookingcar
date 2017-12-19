CREATE TABLE car_fuel
(
  id   NUMBER(10)    NOT NULL PRIMARY KEY,
  name VARCHAR2(255) NOT NULL
);

-- Создание последовательности для суррогатного ключа,таблицы "Тип топлива"
CREATE SEQUENCE car_fuel_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_fuel_trg
BEFORE INSERT ON car_fuel
FOR EACH ROW
  BEGIN
    :new.id := car_fuel_seq.nextval;
  END;
/
-- Заполнение данными таблицы "Тип топлива"
INSERT INTO car_fuel (name) VALUES ('АИ92');
INSERT INTO car_fuel (name) VALUES ('АИ95');
