SELECT employee_id, salary
FROM employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary <> ALL (2000, 3000, 4000)
ORDER BY employee_id;
