/*
Module: bc
Package: car
Author: pymba86
Contents:
 - create table fuel_type
*/
-- Тип топлива
-- for car_fuel_type table
CREATE TABLE car_insurance
(
    id               NUMBER(10)      NOT NULL PRIMARY KEY,  
    name             VARCHAR2(255)   NOT NULL
);

insert into car_insurance values(1,'ОСАГО');
insert into car_insurance values(2,'КАСКО');
insert into car_insurance values(2,'КАСКО+ОСАГО');