SELECT CASE
           WHEN age_group IS NULL THEN '미상'
           ELSE TO_CHAR(age_group, 'FM9990') || '대'
       END AS "연령대",
       SUM(amount_sold) AS "매출금액"
FROM (
    SELECT TRUNC(EXTRACT(YEAR FROM SYSDATE) - c.cust_year_of_birth, -1) AS age_group,
           s.amount_sold
    FROM sales s
    JOIN customers c ON c.cust_id = s.cust_id
    WHERE s.sales_month = '200112'
)
GROUP BY age_group
ORDER BY age_group;
