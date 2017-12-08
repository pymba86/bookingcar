/*
Module: bc
Package: car
Author: pymba86
Contents:
 - create table fuel_type
*/
-- Тип топлива
-- for car_fuel_type table
CREATE TABLE car_gearbox_type
(
    id               NUMBER(10)      NOT NULL PRIMARY KEY,
    code             VARCHAR2(6)     NOT NULL, 
    name             VARCHAR2(255)   NOT NULL
);

--добавить еще другие
--электричество
insert into car_gearbox_type values(1,'A', 'автоматическая');
insert into car_gearbox_type values(2,'M', 'механическая');
