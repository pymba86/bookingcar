/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Клиент"
CREATE TABLE customer
(
  id    NUMBER(10)    NOT NULL PRIMARY KEY,
  name  VARCHAR2(100) NOT NULL,
  phone VARCHAR2(11)  NOT NULL,
  email VARCHAR2(100),

  -- Валидация номера телефона
  CONSTRAINT chk__customer_phone CHECK (length(phone) = 11 AND
                                      regexp_like(phone, '^[[:digit:]]{11}$')),
  -- Валидация почты
  CONSTRAINT chk_customer_email CHECK (regexp_like(email, '^\w+(\.\w+)*+@\w+(\.\w+)+$'))
);

-- Заполнение данными таблицы "Клиент"
INSERT INTO
  customer VALUES (1, 'Artem Matveychuk', '89324360407', 'johndoe@example.com');