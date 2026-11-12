SET SERVEROUTPUT ON

DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN REVERSE 9..1
    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' || i || '= ' || vn_base_num * i);
    END LOOP;
END;
/
