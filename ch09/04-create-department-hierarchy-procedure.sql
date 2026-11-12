CREATE TABLE ch09_dept (
    department_id NUMBER,
    department_name VARCHAR2(100),
    levels NUMBER
);

CREATE OR REPLACE PROCEDURE my_hier_dept_proc
IS
BEGIN
    DELETE FROM ch09_dept;

    INSERT INTO ch09_dept (department_id, department_name, levels)
    SELECT department_id, department_name, LEVEL
    FROM departments
    START WITH parent_id IS NULL
    CONNECT BY PRIOR department_id = parent_id;

    COMMIT;
END;
/

SHOW ERRORS PROCEDURE my_hier_dept_proc

EXEC my_hier_dept_proc;

SELECT department_id,
       LPAD(' ', 3 * (levels - 1)) || department_name AS department_name,
       levels
FROM ch09_dept
ORDER BY levels, department_id;
