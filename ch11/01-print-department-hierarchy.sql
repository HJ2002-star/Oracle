SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE my_dep_hier_proc
IS
    v_count NUMBER := 0;

    PROCEDURE print_departments (
        p_parent_id IN departments.parent_id%TYPE,
        p_level IN NUMBER
    )
    IS
        CURSOR c_departments IS
            SELECT department_id, department_name
            FROM departments
            WHERE parent_id = p_parent_id
               OR (parent_id IS NULL AND p_parent_id IS NULL)
            ORDER BY department_id;
    BEGIN
        FOR r_department IN c_departments
        LOOP
            DBMS_OUTPUT.PUT_LINE(
                r_department.department_id || ' | ' ||
                LPAD(' ', 3 * (p_level - 1)) ||
                r_department.department_name || ' | ' || p_level
            );
            v_count := v_count + 1;

            print_departments(r_department.department_id, p_level + 1);
        END LOOP;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('부서번호 | 부서명 | 계층 수준');
    print_departments(NULL, 1);
    DBMS_OUTPUT.PUT_LINE('출력 부서 수: ' || v_count);
END;
/

SHOW ERRORS PROCEDURE my_dep_hier_proc

EXEC my_dep_hier_proc;
