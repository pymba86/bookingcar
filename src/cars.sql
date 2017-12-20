CREATE OR REPLACE PACKAGE cars AS

  -- Найти заявки которые попадают в указанный промежуток бронирования для машины
  PROCEDURE find(car_id        IN car.id%TYPE,
                 date_start    IN orders.date_start%TYPE,
                 date_end         orders.date_end%TYPE,
                 orders_cursor OUT SYS_REFCURSOR);

  -- Возможность бронирования машины для данного интервала времени
  FUNCTION access(
    car_id     IN car.id%TYPE,
    date_start IN orders.date_start%TYPE,
    date_end   IN orders.date_end%TYPE)
    RETURN BOOLEAN;

END cars;
/
CREATE OR REPLACE PACKAGE BODY cars AS
  FUNCTION access(
    car_id     IN car.id%TYPE,
    date_start IN orders.date_start%TYPE,
    date_end   IN orders.date_end%TYPE)
    RETURN BOOLEAN
  IS
    result  BOOLEAN;
    v_order orders%ROWTYPE;
    orders_cursor SYS_REFCURSOR;
    BEGIN
      cars.find(car_id, date_start, date_end, orders_cursor);
      result := FALSE;
      FETCH orders_cursor INTO v_order;
      IF orders_cursor%NOTFOUND
      THEN
        result := TRUE;
      END IF;
      CLOSE orders_cursor;
      RETURN result;
    END;

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
    END find;

END cars;
/