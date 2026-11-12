SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE ch10_iud_dep_proc (
    p_department_id   IN ch10_departments.department_id%TYPE,
    p_department_name IN ch10_departments.department_name%TYPE,
    p_flag            IN VARCHAR2
)
IS
    v_employee_count NUMBER;
    e_department_has_employees EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_department_has_employees, -20000);
BEGIN
    IF p_flag = 'I' THEN
        INSERT INTO ch10_departments (department_id, department_name)
        VALUES (p_department_id, p_department_name);
    ELSIF p_flag = 'U' THEN
        UPDATE ch10_departments
        SET department_name = p_department_name
        WHERE department_id = p_department_id;
    ELSIF p_flag = 'D' THEN
        SELECT COUNT(*)
        INTO v_employee_count
        FROM employees
        WHERE department_id = p_department_id;

        IF v_employee_count > 0 THEN
            RAISE e_department_has_employees;
        END IF;

        DELETE FROM ch10_departments
        WHERE department_id = p_department_id;
    END IF;
EXCEPTION
    WHEN e_department_has_employees THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('오류 코드: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('해당 부서에 사원이 있어 삭제할 수 없습니다.');
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('이미 존재하는 부서번호입니다.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

SHOW ERRORS PROCEDURE ch10_iud_dep_proc

EXEC ch10_iud_dep_proc(10, NULL, 'D');

SELECT department_id, department_name
FROM ch10_departments
WHERE department_id = 10;
