SELECT a.sales_year, '최대' AS sale_type,
       a.employee_id, e.emp_name, a.total_sales
FROM (
    SELECT SUBSTR(s.sales_month, 1, 4) AS sales_year,
           s.employee_id, SUM(s.amount_sold) AS total_sales
    FROM sales s
    JOIN customers c ON c.cust_id = s.cust_id
    JOIN countries n ON n.country_id = c.country_id
    WHERE n.country_name = 'Italy'
    GROUP BY SUBSTR(s.sales_month, 1, 4), s.employee_id
) a
JOIN employees e ON e.employee_id = a.employee_id
WHERE a.total_sales = (
    SELECT MAX(SUM(s.amount_sold))
    FROM sales s
    JOIN customers c ON c.cust_id = s.cust_id
    JOIN countries n ON n.country_id = c.country_id
    JOIN employees e2 ON e2.employee_id = s.employee_id
    WHERE n.country_name = 'Italy'
      AND SUBSTR(s.sales_month, 1, 4) = a.sales_year
    GROUP BY s.employee_id
)

UNION ALL

SELECT a.sales_year, '최소' AS sale_type,
       a.employee_id, e.emp_name, a.total_sales
FROM (
    SELECT SUBSTR(s.sales_month, 1, 4) AS sales_year,
           s.employee_id, SUM(s.amount_sold) AS total_sales
    FROM sales s
    JOIN customers c ON c.cust_id = s.cust_id
    JOIN countries n ON n.country_id = c.country_id
    WHERE n.country_name = 'Italy'
    GROUP BY SUBSTR(s.sales_month, 1, 4), s.employee_id
) a
JOIN employees e ON e.employee_id = a.employee_id
WHERE a.total_sales = (
    SELECT MIN(SUM(s.amount_sold))
    FROM sales s
    JOIN customers c ON c.cust_id = s.cust_id
    JOIN countries n ON n.country_id = c.country_id
    JOIN employees e2 ON e2.employee_id = s.employee_id
    WHERE n.country_name = 'Italy'
      AND SUBSTR(s.sales_month, 1, 4) = a.sales_year
    GROUP BY s.employee_id
)
ORDER BY sales_year, sale_type DESC, employee_id;
