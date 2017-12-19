CREATE TABLE car_gearbox
(
  id          NUMBER(10)    NOT NULL PRIMARY KEY,
  name VARCHAR2(255) NOT NULL
);

-- Создание последовательности для суррогатного ключа,
-- таблицы "Тип коробки передач"
CREATE SEQUENCE car_gearbox_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER car_gearbox_trg
BEFORE INSERT ON car_gearbox
FOR EACH ROW
  BEGIN
    :new.id := car_gearbox_seq.nextval;
  END;
/
-- Заполнение данными таблицы "Тип коробки передач"
INSERT INTO car_gearbox (name) VALUES ('АКПП');
INSERT INTO car_gearbox (name) VALUES ('МКПП');
