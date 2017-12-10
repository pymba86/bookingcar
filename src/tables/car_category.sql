/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание справочной таблицы "Категория автомобиля"
CREATE TABLE car_category
(
  id                    NUMBER(10) PRIMARY KEY NOT NULL,
  code                  VARCHAR2(25)           NOT NULL,
  description           VARCHAR2(100)          NOT NULL,
  driver_age_min        NUMBER(3),
  driver_experience_min NUMBER(3)
);

-- Заполнение данными таблицы "Категория автомобиля"
INSERT INTO car_category (code,
                          description,
                          driver_age_min,
                          driver_experience_min) VALUES ('A', 'Эконом', 21, 2);

INSERT INTO car_category (code,
                          description,
                          driver_age_min,
                          driver_experience_min) VALUES ('B', 'Средний', 21, 2);

INSERT INTO car_category (code,
                          description,
                          driver_age_min,
                          driver_experience_min) VALUES ('C', 'Бизнес', 23, 3);

