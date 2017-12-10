/*
Проект: bookingcar
Автор: pymba86
*/

----------------------------------------------------------------------
-- Создание
----------------------------------------------------------------------

-- Создание таблицы "Машина"
CREATE TABLE car
(
  id                NUMBER(10)    NOT NULL PRIMARY KEY,
  name              VARCHAR2(100) NOT NULL,
  location_id       NUMBER(10)    NOT NULL,
  category_id       NUMBER(10)    NOT NULL,
  -- Дополнительные данные
  production_year   NUMBER(10),
  body_type_id      NUMBER(10),
  fuel_type_id      NUMBER(10),
  gearbox_type_id   NUMBER(10),
  actuator_type_id NUMBER(10),
  doors             NUMBER(4),
  places            NUMBER(4),

  -- Двигатель
  motor_power       NUMBER(6),
  motor_capacity    NUMBER(6),
  -- Цена за день
  price             NUMBER        NOT NULL,

  CONSTRAINT car_location_id_fk FOREIGN KEY (location_id) REFERENCES location (id),
  CONSTRAINT car_category_id_fk FOREIGN KEY (category_id) REFERENCES car_category (id)
);

-- Создание последовательности для суррогатного ключа,таблицы "Машина"
CREATE SEQUENCE car_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_tgr
BEFORE INSERT ON car
  BEGIN
    :new.id := car_seq.nextval;
  END;
