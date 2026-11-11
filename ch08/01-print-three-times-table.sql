SET SERVEROUTPUT ON

BEGIN
    FOR i IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE('3 x ' || i || ' = ' || (3 * i));
    END LOOP;
END;
/
