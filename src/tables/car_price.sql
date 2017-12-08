

CREATE TABLE car_price
(
    id               NUMBER(10)      NOT NULL PRIMARY KEY,
    car_id           number(10)      NOT NULL,  
    price            number          NOT NULL,
    time             number(6)       NOT NULL
);

-- Так как Справочник
insert into car_price values(1,1,2100, 24);
insert into car_price values(2,1,1800, 48);