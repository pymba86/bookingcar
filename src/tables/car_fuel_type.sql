/*
Module: bc
Package: car
Author: pymba86
Contents:
 - create table fuel_type
*/
-- Тип топлива
-- for car_fuel_type table
CREATE TABLE car_fuel_type
(
  id   NUMBER(10)    NOT NULL PRIMARY KEY,
  code VARCHAR2(6)   NOT NULL,
  description VARCHAR2(255) NOT NULL
);


INSERT INTO car_fuel_type VALUES (1, '92', 'АИ92');
INSERT INTO car_fuel_type VALUES (1, '95', 'АИ95');
