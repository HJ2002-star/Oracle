SELECT region AS "지역",
       SUM(CASE WHEN period = '201111' THEN loan_jan_amt END) AS "201111",
       SUM(CASE WHEN period = '201112' THEN loan_jan_amt END) AS "201112",
       SUM(CASE WHEN period = '201210' THEN loan_jan_amt END) AS "201210",
       SUM(CASE WHEN period = '201211' THEN loan_jan_amt END) AS "201211",
       SUM(CASE WHEN period = '201212' THEN loan_jan_amt END) AS "201212",
       SUM(CASE WHEN period = '201310' THEN loan_jan_amt END) AS "201310",
       SUM(CASE WHEN period = '201311' THEN loan_jan_amt END) AS "201311"
FROM kor_loan_status
WHERE period IN ('201111', '201112', '201210', '201211', '201212', '201310', '201311')
GROUP BY region
ORDER BY region;
