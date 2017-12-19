/*
Автор: pymba86
Содержит:
 - пакет для обработки оплаты клиентов
Таблицы:
 - payment_status(статус оплаты)
 - client(клиент)
 - payment(оплата клиента)
*/

CREATE OR REPLACE PACKAGE payments AS

  -- Сменить статус платежа

  -- Проверка на неоплаченные счета

  -- Добавить платеж

  -- Общая сумма для оплаты(подсчет суммы не оплаченных счетов)
  FUNCTION amount(cp_customer_id IN customer.id%TYPE)
    RETURN NUMBER;

  -- получить список счетов у определенного клиента в зависимости от статуса
  PROCEDURE get_customer_payment(cp_customer_id    IN customer.ID%TYPE,
                                 cp_payment_status IN payment_status.CODE%TYPE,
                                 p_cursor          OUT SYS_REFCURSOR);

  -- Вернуть статус счета по коду
  PROCEDURE get_status(cp_code_name    IN payment_status.code%TYPE,
                       p_status_cursor OUT SYS_REFCURSOR);

  -- Общая проверка оплаченных счетов по заказу
  -- Вывести все счета по категории

  -- Добавление счета на оплату
  PROCEDURE add(cp_customer_id IN customer.id%TYPE,
                cp_price       IN payment.price%TYPE);

  -- Добавление счета на оплату с описанием
  PROCEDURE add(cp_customer_id IN customer.id%TYPE,
                cp_price       IN payment.price%TYPE,
                cp_desc        IN payment.description%TYPE);

END payments;


CREATE OR REPLACE PACKAGE BODY payments AS

  ----------------------------------------------------------------------
    -- Добавление счета на оплату
  PROCEDURE add(cp_customer_id IN customer.id%TYPE,
                cp_price       IN payment.price%TYPE)
  AS
    BEGIN
      add(cp_customer_id,cp_price,null);
    END;

  ----------------------------------------------------------------------
  PROCEDURE add(cp_customer_id IN customer.id%TYPE,
                cp_price       IN payment.price%TYPE,
                cp_desc        IN payment.description%TYPE)
  IS
    p_status_cursor SYS_REFCURSOR;
    status payment_status%ROWTYPE;
    BEGIN
      -- Получаем id статуса
      get_status('NP', p_status_cursor);
      FETCH p_status_cursor INTO status;
      IF p_status_cursor%NOTFOUND
      THEN
        RAISE_APPLICATION_ERROR(20005,
                                'payments.add()-> Не найден статус счета "NP"'
        );
      END IF;
      -- Добавляем новый счет на оплату
      INSERT INTO payment (id, customer_id, status_id, price, date_create, description)
      VALUES (payment_seq.nextval, cp_customer_id, status.id, cp_price, SYSDATE, cp_desc);
    END;

  ----------------------------------------------------------------------
  PROCEDURE get_status(cp_code_name    IN payment_status.code%TYPE,
                       p_status_cursor OUT SYS_REFCURSOR)
  AS
    BEGIN
      OPEN p_status_cursor FOR
      SELECT *
      FROM payment_status
      WHERE payment_status.code = cp_code_name;
    END;

  ----------------------------------------------------------------------
  PROCEDURE get_customer_payment(cp_customer_id    IN customer.ID%TYPE,
                                 cp_payment_status IN payment_status.code%TYPE,
                                 p_cursor          OUT SYS_REFCURSOR)
  AS
    BEGIN
      OPEN p_cursor FOR
      SELECT payment.*
      FROM payment, payment_status
      WHERE payment_status.code = cp_payment_status
            AND payment.customer_id = cp_customer_id
      ORDER BY payment.date_create;
    END;

  ----------------------------------------------------------------------
  FUNCTION amount(cp_customer_id IN customer.id%TYPE)
    RETURN NUMBER
  IS
    total_val     NUMBER;
    p_cursor SYS_REFCURSOR;
    v_rec_payment payment%ROWTYPE;
    BEGIN
      -- Получаем не оплаченные счета
      get_customer_payment(cp_customer_id, 'NP', p_cursor);
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


-- Попытка вывести сумму для оплаты
DECLARE
  x NUMBER;
BEGIN
  x := payments.amount(1);
  dbms_output.put_line('The variable  X = ');
  dbms_output.put_line(x);
END;


-- Попытка добавить новый счет
DECLARE
BEGIN
  payments.add(1, 2000);

END;

COMMIT;