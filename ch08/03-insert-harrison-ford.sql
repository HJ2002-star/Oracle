SET SERVEROUTPUT ON

DECLARE
    v_employee_id employees.employee_id%TYPE;
BEGIN
    SELECT NVL(MAX(employee_id), 0) + 1
    INTO v_employee_id
    FROM employees;

    INSERT INTO employees (
        employee_id, emp_name, email, hire_date, department_id
    )
    VALUES (
        v_employee_id, 'Harrison Ford', 'HARRIS', SYSDATE, 50
    );

    DBMS_OUTPUT.PUT_LINE('신규 사번: ' || v_employee_id);
END;
/

COMMIT;

SELECT employee_id, emp_name, email,
       TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') AS hire_date,
       department_id
FROM employees
WHERE employee_id = (SELECT MAX(employee_id) FROM employees);
