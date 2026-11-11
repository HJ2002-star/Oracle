SET SERVEROUTPUT ON

DECLARE
    v_emp_name employees.emp_name%TYPE;
    v_email    employees.email%TYPE;
BEGIN
    SELECT emp_name, email
    INTO v_emp_name, v_email
    FROM employees
    WHERE employee_id = 201;

    DBMS_OUTPUT.PUT_LINE('사원명: ' || v_emp_name);
    DBMS_OUTPUT.PUT_LINE('이메일: ' || v_email);
END;
/
