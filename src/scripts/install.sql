-- Добавление клиентов
START tables/customer.sql;

-- Добавление локации
START tables/location.sql;

-- Добавление автомобиля
START tables/car_category.sql;
START tables/car_fuel.sql;
START tables/car_gearbox.sql;
START tables/car_actuator.sql;
START tables/car.sql;

-- Добавление Комплектации автомобиля
START tables/car_comp.sql;

-- Добавление заказов
START tables/order_status.sql;
START tables/orders.sql;

-- Добавление Услуг
START tables/service.sql;
START tables/order_service.sql;

-- Добавление Платежей
START tables/payment_category.sql;
START tables/payment_status.sql;
START tables/payment.sql;

-- Добавление пакетов
START cars.sql;
START payments.sql;

-- Добавление триггеров
START triggers/orders.sql;

-- Добавление представлений
START views/car_list.sql;

-- Сохранение промежуточных изменений
COMMIT;