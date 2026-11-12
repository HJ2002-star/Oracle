SET SERVEROUTPUT ON

DECLARE
    TYPE t_employee_emails IS TABLE OF employees.email%TYPE
        INDEX BY VARCHAR2(80);

    v_employee_emails t_employee_emails;
    v_emp_name employees.emp_name%TYPE;
BEGIN
    FOR r_employee IN (
        SELECT emp_name, email
        FROM employees
        ORDER BY employee_id
    )
    LOOP
        v_employee_emails(r_employee.emp_name) := r_employee.email;
    END LOOP;

    v_emp_name := v_employee_emails.FIRST;

    WHILE v_emp_name IS NOT NULL
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            v_emp_name || ' | ' || v_employee_emails(v_emp_name)
        );
        v_emp_name := v_employee_emails.NEXT(v_emp_name);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('출력 사원 수: ' || v_employee_emails.COUNT);
END;
/
