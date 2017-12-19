CREATE TABLE service
(
  id          NUMBER(10)     NOT NULL PRIMARY KEY,
  name        VARCHAR2(255)  NOT NULL,
  description VARCHAR2(1000) NOT NULL,
  -- Цена за день
  price       NUMBER         NOT NULL,

  CONSTRAINT service_check_price CHECK (price >= 0)
);

-- Создание последовательности для суррогатного ключа,таблицы "Услуга"
CREATE SEQUENCE service_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER service_trg
BEFORE INSERT ON service
FOR EACH ROW
  BEGIN
    :new.id := service_seq.nextval;
  END;
/
-- Заполнение данными таблицы "Услуга"
INSERT INTO service (name, description, price) VALUES
  ('Детское кресло',
   'Детское кресло используется для перевозки детей до 12 лет(см.ПДД)',
   300);

INSERT INTO service (name, description, price) VALUES
  ('Навигатор',
   'Помогает передвигатся по городу без пробок',
   400);

INSERT INTO service (name, description, price) VALUES
  ('Дополнительный водитель',
   'Дополнительный водитель в договоре аренды',
   600);

INSERT INTO service (name, description, price) VALUES
  ('Суперстраховка',
   'Снимает ответственность за повреждения автомобиля при' ||
   'наступлении страхового события. Ответственность за угон остается',
   900);
