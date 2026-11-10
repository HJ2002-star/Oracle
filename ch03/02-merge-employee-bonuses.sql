DELETE ex3_3;

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
  AND s.sales_month BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;

COMMIT;

MERGE INTO ex3_3 d
USING (
    SELECT employee_id, salary
    FROM employees
    WHERE manager_id = 145
) s
ON (d.employee_id = s.employee_id)
WHEN MATCHED THEN
    UPDATE SET d.bonus_amt = s.salary * 0.01
WHEN NOT MATCHED THEN
    INSERT (employee_id, bonus_amt)
    VALUES (s.employee_id, s.salary * 0.005);

COMMIT;

SELECT d.employee_id, e.salary, d.bonus_amt
FROM ex3_3 d
JOIN employees e ON e.employee_id = d.employee_id
WHERE e.manager_id = 145
ORDER BY d.employee_id;
