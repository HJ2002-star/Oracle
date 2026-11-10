SELECT cust_id,
       cust_year_of_birth,
       CASE
           WHEN age_years >= 10 THEN TO_CHAR(TRUNC(age_years, -1), 'FM9990') || '대'
           WHEN age_years >= 0 THEN '10세 미만'
           ELSE '미상'
       END AS "연령대"
FROM (
    SELECT cust_id,
           cust_year_of_birth,
           EXTRACT(YEAR FROM SYSDATE) - cust_year_of_birth AS age_years
    FROM customers
);
