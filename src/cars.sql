/*
Автор: pymba86
Содержит:
 - пакет для обработки заказов
Таблицы:
 - payment_status(статус оплаты)
 - client(клиент)
 - client_payment(оплата клиента)
*/

CREATE OR REPLACE PACKAGE cars AS

  -- Доступные категории автомобилей
  PROCEDURE get_categories(cp_customer_id IN car_category.id%TYPE, cat_cursor OUT SYS_REFCURSOR)
  AS
    BEGIN
      OPEN cat_cursor FOR
      SELECT car_category.*
      FROM car_category customer
      WHERE customer.id = cp_customer_id
            AND car_category.driver_age_min <= customer.birthday
            AND car_category.driver_experience_min <= customer.date_dlicense;
    END;

  -- Найти машины, которые доступны для бронирования
  -- в заданный промежуток времени
  PROCEDURE find(date_start IN orders.date_start%TYPE,
                 date_end      orders.date_end%TYPE)
  AS
    BEGIN
      SELECT
        car.id,
        car.name,
        car.client_id
      FROM car, orders
      WHERE car.id != orders.id
            AND orders.date_end > date_start
            AND orders.date_start < date_start
            OR orders.date_end > date_end;
    END find;


  -- Добавить опции автомобилю


END; -- cars