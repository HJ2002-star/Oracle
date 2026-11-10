SELECT employee_id AS "사원번호",
       emp_name AS "사원명",
       hire_date AS "입사일자",
       TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TRUNC(hire_date)) / 12) AS "근속년수"
FROM employees
WHERE MONTHS_BETWEEN(TRUNC(SYSDATE), TRUNC(hire_date)) >= 120
ORDER BY "근속년수" DESC, hire_date, employee_id;
