CREATE TABLE payment_category
(
  id          NUMBER(10)  NOT NULL PRIMARY KEY,
  name VARCHAR2(100)
);

-- Создание последовательности для суррогатного ключа,таблицы "Категория счета"
CREATE SEQUENCE payment_category_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER payment_category_trg
BEFORE INSERT ON payment_category
FOR EACH ROW
  BEGIN
    :new.id := payment_category_seq.nextval;
  END;
/
-- Заполнение данными таблицы "Категория счета"
INSERT INTO payment_category(name) VALUES ('Машина');
INSERT INTO payment_category(name) VALUES ('Опция');
INSERT INTO payment_category(name) VALUES ('Штраф');
INSERT INTO payment_category(name) VALUES ('Другое');

