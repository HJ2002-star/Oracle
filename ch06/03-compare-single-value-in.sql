SELECT a.department_id, a.department_name, b.employee_id, b.emp_name
FROM departments a, employees b
WHERE a.department_id = b.department_id(+)
  AND b.department_id(+) IN (10)
ORDER BY a.department_id, b.employee_id;

SELECT a.department_id, a.department_name, b.employee_id, b.emp_name
FROM departments a, employees b
WHERE a.department_id = b.department_id(+)
  AND b.department_id(+) = 10
ORDER BY a.department_id, b.employee_id;
