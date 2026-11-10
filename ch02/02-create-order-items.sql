CREATE TABLE order_items (
    order_id     NUMBER(12,0),
    line_item_id NUMBER(3,0),
    product_id   NUMBER(3,0),
    unit_price   NUMBER(8,2) DEFAULT 0,
    quantity     NUMBER(8,0) DEFAULT 0,
    CONSTRAINT order_items_pk PRIMARY KEY (order_id, line_item_id)
);

DESC order_items
