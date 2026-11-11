SELECT e.employee_id AS "사번",
       e.emp_name AS "사원명",
       j.job_title AS "job명칭",
       TO_CHAR(h.start_date, 'YYYY-MM-DD') AS "job시작일자",
       TO_CHAR(h.end_date, 'YYYY-MM-DD') AS "job종료일자",
       d.department_name AS "job수행부서명"
FROM employees e
JOIN job_history h ON h.employee_id = e.employee_id
JOIN jobs j ON j.job_id = h.job_id
JOIN departments d ON d.department_id = h.department_id
WHERE e.employee_id = 101
ORDER BY h.start_date;
