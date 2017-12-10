/*
Автор: pymba86
Содержит:
 - пакет для обработки заказов
Таблицы:
 - payment_status(статус оплаты)
 - client(клиент)
 - client_payment(оплата клиента)
*/



CREATE OR REPLACE PACKAGE orders AS

  -- Найти заявки которые попадают в указанный промежуток бронирования для машины
  PROCEDURE find(car_id        IN car.id%TYPE, date_start IN orders.date_start%TYPE,
                 date_end         orders.date_end%TYPE,
                 orders_cursor OUT SYS_REFCURSOR)
  AS
    BEGIN
      OPEN orders_cursor FOR
      SELECT *
      FROM orders
      WHERE orders.car_id = car_id
            AND orders.date_end > date_start
            AND orders.date_start < date_start
            OR orders.date_end > date_end;
      EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
      DBMS_OUTPUT.put_line('Не удалось найти заявки, которые попадают в промежуток('
                           || date_start || ';' || date_end);
      WHEN OTHERS
      THEN
      DBMS_OUTPUT.put_line('Неизвестная ошибка');
    END find;

  -- Возможность бронирования машины для данного интервала времени
  FUNCTION check_time(
    car_id     IN car.id%TYPE,
    date_start IN orders.date_start%TYPE,
    date_end   IN orders.date_end%TYPE)
    RETURN BOOLEAN
  IS
    result BOOLEAN;
    v_order order% ROWTYPE;
    orders_cursor SYS_REFCURSOR;
    BEGIN
      orders.find(car_id, date_start, date_end, orders_cursor);
      result := FALSE;
      FETCH orders_cursor INTO v_order;
      IF orders_cursor%NOTFOUND
      THEN
        result := TRUE;
      END IF;
      CLOSE orders_cursor;
      RETURN result;
    END;


  -- -- Добавить дополнительные услуги для клиента

  -- Подсчет общей суммы для оплаты по заказу
  -- Добавить дополнительные услуги к заказу

  -- Выдать автомобиль(Поменять статус)

END; -- orders
