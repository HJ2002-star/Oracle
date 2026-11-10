CREATE SEQUENCE orders_seq
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 99999999;

SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences
WHERE sequence_name = 'ORDERS_SEQ';
