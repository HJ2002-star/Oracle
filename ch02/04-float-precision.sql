SELECT ROUND(LOG(10, 2), 5) AS log10_2,
       ROUND(126 * LOG(10, 2), 5) AS decimal_precision,
       CEIL(126 * LOG(10, 2)) AS decimal_digits
FROM dual;
