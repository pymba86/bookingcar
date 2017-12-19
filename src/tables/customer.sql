CREATE TABLE customer
(
  id                 NUMBER(10)    NOT NULL PRIMARY KEY,
  name               VARCHAR2(100) NOT NULL,
  phone              VARCHAR2(11)  NOT NULL,
  email              VARCHAR2(100) NOT NULL,
  birthday           DATE          NOT NULL,
  driving_experience NUMBER(10)    NOT NULL,

  -- Валидация номера телефона
  CONSTRAINT chk__customer_phone CHECK (length(phone) = 11 AND
                                        regexp_like(phone, '^[[:digit:]]{11}$')),
  -- Валидация почты
  CONSTRAINT chk_customer_email CHECK (regexp_like(email, '^\w+(\.\w+)*+@\w+(\.\w+)+$'))
);

-- Создание последовательности для суррогатного ключа,таблицы "Клиент"
CREATE SEQUENCE customer_seq;

-- Создание триггера на авто инкремент
CREATE TRIGGER customer_trg
BEFORE INSERT ON customer
FOR EACH ROW
  BEGIN
    :new.id := customer_seq.nextval;
  END;
/
-- Заполнение тестовыми данными таблицы "Клиент"
INSERT INTO customer VALUES
  (NULL, 'Артем Матвейчук', '89324360407', 'pymba1996@live.com', TO_DATE('1996-11-11', 'yyyy-mm-dd'), 2);
INSERT INTO customer VALUES
  (NULL, 'Иван Иванов', '89324360401', 'ivanov@mail.ru', TO_DATE('2000-01-01', 'yyyy-mm-dd'), 0);
INSERT INTO customer VALUES
  (NULL, 'Олег Аникин', '89505318896', 'anikin@gmail.com', TO_DATE('1971-03-24', 'yyyy-mm-dd'), 20);