CREATE TABLE car_category
(
  id                    NUMBER(10) PRIMARY KEY NOT NULL,
  name           VARCHAR2(100)          NOT NULL,
  driver_age_min        NUMBER(3),
  driver_experience_min NUMBER(3)
);

-- Создание последовательности для суррогатного ключа,таблицы "Категория автомобиля"
CREATE SEQUENCE car_category_seq;

-- Создание индекса на столбец название
CREATE INDEX car_category_name_idx ON car_category(name);

-- Создание триггера на авто инкремент
CREATE TRIGGER car_category_trg
BEFORE INSERT ON car_category
FOR EACH ROW
  BEGIN
    :new.id := car_category_seq.nextval;
  END;
/
-- Заполнение данными таблицы "Категория автомобиля"
INSERT INTO car_category (name,
                          driver_age_min,
                          driver_experience_min) VALUES ('Эконом', 21, 2);

INSERT INTO car_category (name,
                          driver_age_min,
                          driver_experience_min) VALUES ('Средний', 21, 2);

INSERT INTO car_category (name,
                          driver_age_min,
                          driver_experience_min) VALUES ('Бизнес', 23, 3);

