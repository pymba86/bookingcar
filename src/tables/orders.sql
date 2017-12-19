CREATE TABLE orders
(
  id          NUMBER(10) NOT NULL PRIMARY KEY,
  customer_id NUMBER(10) NOT NULL,
  car_id      NUMBER(10) NOT NULL,
  status_id   NUMBER(10) NOT NULL,
  -- дата создание заказа
  date_create DATE       NOT NULL,
  -- срок аренды
  date_start  DATE       NOT NULL,
  date_end    DATE       NOT NULL,

  CONSTRAINT orders_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer (ID),
  CONSTRAINT orders_car_id_fk FOREIGN KEY (car_id) REFERENCES car (id)

);
                          