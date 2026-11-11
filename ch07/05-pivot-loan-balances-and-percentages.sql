WITH monthly_loans AS (
    SELECT period, region, gubun,
           SUM(loan_jan_amt) AS loan_balance
    FROM kor_loan_status
    WHERE period IN ('201111', '201112', '201210', '201211',
                     '201212', '201310', '201311')
    GROUP BY period, region, gubun
),
loan_shares AS (
    SELECT period, region, gubun,
           TO_CHAR(loan_balance, 'TM9') || ' (' ||
           TO_CHAR(
               NVL(ROUND(
                   RATIO_TO_REPORT(NULLIF(loan_balance, 0))
                       OVER (PARTITION BY region, period) * 100
               ), 0),
               'FM990'
           ) || '%)' AS balance_and_percent
    FROM monthly_loans
)
SELECT region AS "지역",
       gubun AS "대출종류",
       MAX(CASE WHEN period = '201111' THEN balance_and_percent END) AS "201111",
       MAX(CASE WHEN period = '201112' THEN balance_and_percent END) AS "201112",
       MAX(CASE WHEN period = '201210' THEN balance_and_percent END) AS "201210",
       MAX(CASE WHEN period = '201211' THEN balance_and_percent END) AS "201211",
       MAX(CASE WHEN period = '201212' THEN balance_and_percent END) AS "201212",
       MAX(CASE WHEN period = '201310' THEN balance_and_percent END) AS "201310",
       MAX(CASE WHEN period = '201311' THEN balance_and_percent END) AS "201311"
FROM loan_shares
GROUP BY region, gubun
ORDER BY region, gubun;
