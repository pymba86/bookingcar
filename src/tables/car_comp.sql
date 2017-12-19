/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Комплектация автомобиля"
CREATE TABLE car_comp
(
  id          NUMBER(10)     NOT NULL PRIMARY KEY,
  car_id      NUMBER(10)     NOT NULL,
  description VARCHAR2(1000) NOT NULL
);

-- Создание последовательности для суррогатного ключа,таблицы "Комплектация автомобиля"
CREATE SEQUENCE car_comp_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_comp_trg
BEFORE INSERT ON car_comp
FOR EACH ROW
  BEGIN
    :new.id := car_comp_seq.nextval;
  END;

-- Заполнение данными таблицы "Комплектация автомобиля"
INSERT INTO car_comp (car_id,description) VALUES
  (1,'ESP');

INSERT INTO car_comp (car_id,description) VALUES
  (1,'ABS');

INSERT INTO car_comp (car_id,description) VALUES
  (2,'Усилитель руля');

INSERT INTO car_comp (car_id,description) VALUES
  (4,'Электро-регулировка боковых зеркал');

INSERT INTO car_comp (car_id,description) VALUES
  (7,'Вентиляция передних сидений');

INSERT INTO car_comp (car_id,description) VALUES
  (6,'Камера заднего вида');

INSERT INTO car_comp (car_id,description) VALUES
  (6,'Обивка сидений кожей');

INSERT INTO car_comp (car_id,description) VALUES
  (8,'Центральный подлокотник для задних сидений');
