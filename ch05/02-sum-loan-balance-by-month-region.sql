SELECT period, region, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE period LIKE '2012%'
GROUP BY period, region
ORDER BY period, region;
