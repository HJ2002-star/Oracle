SELECT a.department_id, a.department_name
FROM departments a
JOIN employees b ON a.department_id = b.department_id
WHERE b.salary > 3000
ORDER BY a.department_name;
