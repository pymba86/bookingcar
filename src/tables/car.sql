/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Машина"
CREATE TABLE car
(
  id               NUMBER(10)    NOT NULL PRIMARY KEY,
  name             VARCHAR2(100) NOT NULL,
  location_id      NUMBER(10)    NOT NULL,
  category_id      NUMBER(10)    NOT NULL,

  -- Дополнительные данные
  production_year  NUMBER(4),
  fuel_type_id     NUMBER(10),
  gearbox_type_id  NUMBER(10),
  actuator_type_id NUMBER(10),
  doors            NUMBER(2),
  places           NUMBER(2),

  -- Двигатель
  motor_power      NUMBER(6),
  -- Цена за день
  price            NUMBER        NOT NULL,

  CONSTRAINT car_location_id_fk FOREIGN KEY (location_id) REFERENCES location (id),
  CONSTRAINT car_category_id_fk FOREIGN KEY (category_id) REFERENCES car_category (id),
  CONSTRAINT car_check_price CHECK (price >= 0)
);

-- Создание последовательности для суррогатного ключа,таблицы "Машина"
CREATE SEQUENCE car_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_trg
BEFORE INSERT ON car
FOR EACH ROW
  BEGIN
    :new.id := car_seq.nextval;
  END;

-- Заполнение данными таблицы "Машина"
INSERT INTO car VALUES (null,'Volvo S40',1,1,2009,1,2,1,4,5,120,2800);
INSERT INTO car VALUES (null,'Hyundai Solaris',2,1,2010,1,1,1,4,5,114,2950);
INSERT INTO car VALUES (null,'Toyota RAV4',1,2,2014,2,1,3,4,5,140,3500);
INSERT INTO car VALUES (null,'Mitsubishi Pajero',1,2,2012,2,1,3,4,5,180,3600);
INSERT INTO car VALUES (null,'Toyota Camry',2,2,2010,2,1,1,4,5,160,3800);
INSERT INTO car VALUES (null,'Mercedes-Benz E-Class',1,3,2011,2,1,2,4,5,210,4500);
INSERT INTO car VALUES (null,'Audi A4',1,3,2015,2,1,1,4,5,280,5000);
INSERT INTO car VALUES (null,'Jaguar XF',2,3,2014,2,1,2,4,5,300,8000);