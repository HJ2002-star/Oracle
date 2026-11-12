CREATE OR REPLACE FUNCTION my_last_day (
    p_date IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_date DATE;
    v_last_date DATE;
BEGIN
    v_date := TO_DATE(p_date, 'YYYY-MM-DD');
    v_last_date := ADD_MONTHS(TRUNC(v_date, 'MM'), 1) - 1;

    RETURN TO_CHAR(v_last_date, 'YYYY-MM-DD');
END;
/

SHOW ERRORS FUNCTION my_last_day

SELECT my_last_day('2026-11-12') AS my_result,
       TO_CHAR(LAST_DAY(DATE '2026-11-12'), 'YYYY-MM-DD') AS oracle_result
FROM dual;

SELECT my_last_day('2024-02-10') AS leap_year_result,
       my_last_day('2025-02-10') AS normal_year_result
FROM dual;
