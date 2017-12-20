CREATE TABLE orders
(
  id          NUMBER(10) NOT NULL PRIMARY KEY,
  customer_id NUMBER(10) NOT NULL,
  car_id      NUMBER(10) NOT NULL,
  status_id   NUMBER(10) NOT NULL,
  -- срок аренды
  date_start  DATE       NOT NULL,
  date_end    DATE       NOT NULL,

  CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer (ID),
  CONSTRAINT orders_car_id_fk FOREIGN KEY (car_id) REFERENCES car (id),
  CONSTRAINT orders_status_id_fk FOREIGN KEY (status_id) REFERENCES order_status (id)

);

-- Создание последовательности для суррогатного ключа,таблицы "Заказы"
CREATE SEQUENCE orders_seq;

                          