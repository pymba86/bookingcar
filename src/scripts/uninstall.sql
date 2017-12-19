-- Удаление платежей
DROP TABLE payment;
DROP SEQUENCE PAYMENT_SEQ;

DROP TABLE payment_category;
DROP SEQUENCE PAYMENT_CATEGORY_SEQ;

DROP TABLE payment_status;
DROP SEQUENCE PAYMENT_STATUS_SEQ;

-- Удаление услуг
DROP TABLE order_service;
DROP SEQUENCE ORDER_SERVICE_SEQ;

DROP TABLE service;
DROP SEQUENCE SERVICE_SEQ;

-- Удаление заказов
DROP TABLE orders;

DROP TABLE order_status;
DROP SEQUENCE ORDER_STATUS_SEQ;

-- Удаление комплектации автомобиля
DROP TABLE car_comp;
DROP SEQUENCE CAR_COMP_SEQ;

-- Удаление автомобиля
DROP TABLE car;
DROP SEQUENCE CAR_SEQ;

DROP TABLE car_actuator;
DROP SEQUENCE CAR_ACTUATOR_SEQ;

DROP TABLE car_gearbox;
DROP SEQUENCE CAR_GEARBOX_SEQ;

DROP TABLE car_fuel;
DROP SEQUENCE CAR_FUEL_SEQ;

DROP TABLE car_category;
DROP SEQUENCE CAR_CATEGORY_SEQ;

-- Удаление локации
DROP TABLE location;
DROP SEQUENCE LOCATION_SEQ;

-- Удаление клиентов
DROP TABLE customer;
DROP SEQUENCE CUSTOMER_SEQ;

-- Сохранение промежуточных изменений
COMMIT;