CREATE TABLE ex3_6 AS
SELECT employee_id, emp_name, salary, manager_id
FROM employees
WHERE 1 = 0;

INSERT INTO ex3_6 (employee_id, emp_name, salary, manager_id)
SELECT employee_id, emp_name, salary, manager_id
FROM employees
WHERE manager_id = 124
  AND salary BETWEEN 2000 AND 3000;

COMMIT;

SELECT employee_id, emp_name, salary, manager_id
FROM ex3_6
ORDER BY employee_id;
