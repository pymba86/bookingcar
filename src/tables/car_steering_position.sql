/*
Module: bc
Package: car
Author: pymba86
Contents:
 - create table fuel_type
*/
-- Тип топлива
-- for car_fuel_type table
CREATE TABLE car_steering_position
(
    id               NUMBER(10)      NOT NULL PRIMARY KEY,  
    name             VARCHAR2(255)   NOT NULL
);

--добавить еще другие
--электричество
insert into car_steering_position values(1,'слево');
insert into car_steering_position values(2,'справо');
