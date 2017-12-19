/*
Проект: bookingcar
Автор: pymba86
*/

CREATE OR REPLACE PACKAGE payments AS

  -- Общая сумма для оплаты(подсчет суммы не оплаченных счетов)
  FUNCTION amount(cp_customer_id IN customer.id%TYPE) RETURN NUMBER;

  -- получить список счетов у определенного клиента в зависимости от статуса
  PROCEDURE get_customer_payment(cp_customer_id    IN customer.ID%TYPE,
                                 cp_payment_status IN payment_status.name%TYPE,
                                 p_cursor          OUT SYS_REFCURSOR);

END payments;

CREATE OR REPLACE PACKAGE BODY payments AS

  ----------------------------------------------------------------------
  PROCEDURE get_customer_payment(cp_customer_id    IN customer.ID%TYPE,
                                 cp_payment_status IN payment_status.name%TYPE,
                                 p_cursor          OUT SYS_REFCURSOR)
  AS
    BEGIN
      OPEN p_cursor FOR
      SELECT
        payment.*
      FROM payment, payment_status, payment_category, orders
      WHERE payment_status.name = cp_payment_status
            AND payment.order_id = orders.id
            AND orders.customer_id = cp_customer_id
      ORDER BY payment.date_create;
    END;

  ----------------------------------------------------------------------
  FUNCTION amount(cp_customer_id IN customer.id%TYPE, cp_status_name IN payment_status.name%TYPE)
    RETURN NUMBER
  IS
    total_val     NUMBER;
    p_cursor SYS_REFCURSOR;
    v_rec_payment payment%ROWTYPE;
    BEGIN
      -- Получаем не оплаченные счета
      get_customer_payment(cp_customer_id, cp_status_name, p_cursor);
      total_val := 0;
      -- Суммируем счета
      LOOP
        FETCH p_cursor INTO v_rec_payment;
        EXIT WHEN p_cursor%NOTFOUND;
        total_val := total_val + v_rec_payment.price;
      END LOOP;
      CLOSE p_cursor;
      RETURN total_val;
    END;

END payments;