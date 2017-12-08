
-- for car table
CREATE TABLE car_time_report
(
  id          NUMBER(10)  NOT NULL PRIMARY KEY,
  order_id    NUMBER(10)  NOT NULL,
  date_create DATE        NOT NULL,
  mileage     NUMBER(100) NOT NULL,
  CONSTRAINT time_report_order_id_fk FOREIGN KEY (order_id) REFERENCES orders (id)
);

--тригер на добавление - время должно само ставится

INSERT INTO car VALUES (1, 67494364341, 'Volvo S40');