SELECT cust_id,
       cust_year_of_birth,
       DECODE(TRUNC(EXTRACT(YEAR FROM SYSDATE) - cust_year_of_birth, -1),
              30, '30대',
              40, '40대',
              50, '50대',
              '기타') AS "연령대"
FROM customers;
