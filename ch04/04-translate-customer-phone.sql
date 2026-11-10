SELECT TRANSLATE(cust_main_phone_number, '0123456789', 'ABCDEFGHIJ')
           AS cust_main_phone_number
FROM customers;
