CREATE TABLE orders (
    order_id     NUMBER(12,0),
    order_date   DATE,
    order_mode   VARCHAR2(8 BYTE),
    customer_id  NUMBER(6,0),
    order_status NUMBER(2,0),
    order_total  NUMBER(8,2) DEFAULT 0,
    sales_rep_id NUMBER(6,0),
    promotion_id NUMBER(6,0),
    CONSTRAINT orders_pk PRIMARY KEY (order_id),
    CONSTRAINT orders_mode_ck CHECK (order_mode IN ('direct', 'online'))
);

DESC orders
