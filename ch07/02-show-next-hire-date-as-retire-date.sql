SELECT employee_id,
       emp_name,
       TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') AS hire_date,
       TO_CHAR(
           LEAD(hire_date) OVER (ORDER BY hire_date, employee_id),
           'YYYY/MM/DD HH24:MI:SS'
       ) AS retire_date
FROM employees
WHERE job_id = 'SH_CLERK'
ORDER BY hire_date, employee_id;
