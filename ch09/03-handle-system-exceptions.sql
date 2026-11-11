SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE ch10_iud_dep_proc (
    p_department_id   IN ch10_departments.department_id%TYPE,
    p_department_name IN ch10_departments.department_name%TYPE,
    p_flag            IN VARCHAR2
)
IS
BEGIN
    IF p_flag = 'I' THEN
        INSERT INTO ch10_departments (department_id, department_name)
        VALUES (p_department_id, p_department_name);
    ELSIF p_flag = 'U' THEN
        UPDATE ch10_departments
        SET department_name = p_department_name
        WHERE department_id = p_department_id;
    ELSIF p_flag = 'D' THEN
        DELETE FROM ch10_departments
        WHERE department_id = p_department_id;
    END IF;
EXCEPTION
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

EXEC ch10_iud_dep_proc(10, '총무기획부', 'I');

SELECT department_id, department_name
FROM ch10_departments
WHERE department_id = 10;
