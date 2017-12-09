/*
Module: bc
Package: car
Author: pymba86
Contents:
 - create table fuel_type
*/
CREATE TABLE car_actuator_type
(
  id   NUMBER(10)    NOT NULL PRIMARY KEY,
  code VARCHAR2(6)   NOT NULL,
  name VARCHAR2(255) NOT NULL
);

INSERT INTO car_gearbox_type VALUES (1, 'FRONT', 'Передний');
INSERT INTO car_gearbox_type VALUES (2, 'BACK', 'Задний');
INSERT INTO car_gearbox_type VALUES (2, 'FOUR', 'Полный');
