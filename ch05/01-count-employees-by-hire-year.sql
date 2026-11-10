SELECT EXTRACT(YEAR FROM hire_date) AS hire_year,
       COUNT(*) AS employee_count
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;
