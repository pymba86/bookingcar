/*
Проект: bookingcar
Автор: pymba86
*/

-- Создание таблицы "Машина"
CREATE TABLE orders
(
    id               number(10)                             NOT NULL PRIMARY KEY,  
    client_id        number(10)                            NOT NULL,
    car_id           number(10)                             NOT NULL,
    date_create      TIMESTAMP(0) WITH LOCAL TIME ZONE      NOT NULL,
    date_start       TIMESTAMP(0) WITH LOCAL TIME ZONE      NOT NULL,
    date_end         TIMESTAMP(0) WITH LOCAL TIME ZONE      NOT NULL,
    payment_id

    CONSTRAINT order_client_id_fk FOREIGN KEY(client_id) REFERENCES client(id),
    CONSTRAINT order_car_id_fk FOREIGN KEY(car_id) REFERENCES car(id)
);

-- Информация по заказу 
VIEW order_info AS
SELECT orders.id, client.name
orders.date_start,
orders.date_end,
car.name
FROM orders, client, car
WHERE client.id = orders.client_id
AND car.id = orders.car_id 

-- Валидация на добавление/обновление заявки
TRIGGER validate_order
BEFORE INSERT OR UPDATE
ON orders    
BEGIN

 -- Проверить на то что дата начало не должна быть меньше текущей
IF (:NEW.date_start < SYSDATE) and (:NEW.date_end > :NEW.date_start )
THEN
raise_application_error
(-20000
, 'Заявка не может быть создана: время бронирования указано не правильно'
);

 -- Проверить есть ли у него не оплаченные счета
END IF;
IF payments.amount(:NEW.client_id) > 0
THEN
RAISE_APPLICATION_ERROR (
−20001,
'Заявка не может быть создана: у клиента есть не оплаченные счета'
);

 -- Проверить на попадает ли на другой диапазон
IF orders.check(:NEW.car_id, :NEW.date_start, :NEW.date_end)
THEN
raise_application_error
(-20000
, 'Заявка не может быть создана: машина уже забранирована в это время'
);

-- Добавляем счет на оплату
price := calculate(car_id,date_start,date_end);
INSERT INTO payment(id,client_id,price) VALUES(id,payment_id_seq.NEXTVAL;client_id,price);

END;

-- Тестовые данные

 insert into  orders values (1,1,1,
                          TIMESTAMP '2017-12-04 12:00:00',
                          TIMESTAMP '2017-12-04 2:00:00', TIMESTAMP '2017-12-05 2:00:00',
                          100);
                          