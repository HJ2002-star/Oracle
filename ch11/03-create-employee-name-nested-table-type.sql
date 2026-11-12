CREATE OR REPLACE TYPE nt_ch11_emp AS TABLE OF VARCHAR2(80);
/

SHOW ERRORS TYPE nt_ch11_emp

SELECT type_name, coll_type, elem_type_name, length
FROM user_coll_types
WHERE type_name = 'NT_CH11_EMP';
