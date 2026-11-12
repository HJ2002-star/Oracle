SET SERVEROUTPUT ON

CREATE TABLE ch09_departments AS
SELECT department_id, department_name, parent_id
FROM departments;

CREATE OR REPLACE PROCEDURE my_dept_manage_proc (
    p_department_id   IN ch09_departments.department_id%TYPE,
    p_department_name IN ch09_departments.department_name%TYPE,
    p_parent_id       IN ch09_departments.parent_id%TYPE,
    p_flag            IN VARCHAR2
)
IS
    v_employee_count NUMBER;
BEGIN
    IF p_flag = 'upsert' THEN
        MERGE INTO ch09_departments d
        USING (
            SELECT p_department_id AS department_id,
                   p_department_name AS department_name,
                   p_parent_id AS parent_id
            FROM dual
        ) s
        ON (d.department_id = s.department_id)
        WHEN MATCHED THEN
            UPDATE SET d.department_name = s.department_name,
                       d.parent_id = s.parent_id
        WHEN NOT MATCHED THEN
            INSERT (department_id, department_name, parent_id)
            VALUES (s.department_id, s.department_name, s.parent_id);

        DBMS_OUTPUT.PUT_LINE('부서 추가 또는 수정이 완료되었습니다.');
    ELSIF p_flag = 'delete' THEN
        SELECT COUNT(*)
        INTO v_employee_count
        FROM employees
        WHERE department_id = p_department_id;

        IF v_employee_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE('해당 부서에 사원이 있어 삭제할 수 없습니다.');
        ELSE
            DELETE FROM ch09_departments
            WHERE department_id = p_department_id;

            DBMS_OUTPUT.PUT_LINE('삭제된 부서 수: ' || SQL%ROWCOUNT);
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('작업 구분은 upsert 또는 delete로 입력하세요.');
    END IF;

    COMMIT;
END;
/

SHOW ERRORS PROCEDURE my_dept_manage_proc

EXEC my_dept_manage_proc(999, '실습부서', 10, 'upsert');

SELECT department_id, department_name, parent_id
FROM ch09_departments
WHERE department_id = 999;

EXEC my_dept_manage_proc(999, '수정실습부서', 20, 'upsert');

SELECT department_id, department_name, parent_id
FROM ch09_departments
WHERE department_id = 999;

EXEC my_dept_manage_proc(10, NULL, NULL, 'delete');

SELECT department_id, department_name, parent_id
FROM ch09_departments
WHERE department_id = 10;

EXEC my_dept_manage_proc(999, NULL, NULL, 'delete');

SELECT COUNT(*) AS remaining_test_department
FROM ch09_departments
WHERE department_id = 999;
