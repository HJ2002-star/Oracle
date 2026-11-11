SELECT sales_month AS "매출월",
       country_region AS "지역(대륙)",
       total_sales AS "매출금액"
FROM (
    SELECT s.sales_month,
           n.country_region,
           SUM(s.amount_sold) AS total_sales,
           DENSE_RANK() OVER (
               PARTITION BY s.sales_month
               ORDER BY SUM(s.amount_sold)
           ) AS sales_rank
    FROM sales s
    JOIN customers c ON c.cust_id = s.cust_id
    JOIN countries n ON n.country_id = c.country_id
    GROUP BY s.sales_month, n.country_region
)
WHERE sales_rank = 1
ORDER BY sales_month, country_region;
