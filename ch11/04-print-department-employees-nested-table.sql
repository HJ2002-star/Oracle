SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE my_dept_emp_proc (
    p_department_id IN departments.department_id%TYPE
)
IS
    TYPE t_employee_record IS RECORD (
        employee_id employees.employee_id%TYPE,
        emp_name employees.emp_name%TYPE,
        department_name departments.department_name%TYPE
    );

    TYPE t_employee_table IS TABLE OF t_employee_record;
    v_employees t_employee_table := t_employee_table();
BEGIN
    SELECT e.employee_id, e.emp_name, d.department_name
    BULK COLLECT INTO v_employees
    FROM employees e
    JOIN departments d ON d.department_id = e.department_id
    WHERE e.department_id = p_department_id
    ORDER BY e.employee_id;

    DBMS_OUTPUT.PUT_LINE('사원번호 | 사원명 | 부서명');

    IF v_employees.COUNT > 0 THEN
        FOR i IN 1..v_employees.COUNT
        LOOP
            DBMS_OUTPUT.PUT_LINE(
                v_employees(i).employee_id || ' | ' ||
                v_employees(i).emp_name || ' | ' ||
                v_employees(i).department_name
            );
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('해당 부서에 사원이 없습니다.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('출력 사원 수: ' || v_employees.COUNT);
END;
/

SHOW ERRORS PROCEDURE my_dept_emp_proc

EXEC my_dept_emp_proc(60);
