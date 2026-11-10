CREATE TABLE promotions (
    promo_id   NUMBER(6,0),
    promo_name VARCHAR2(20),
    CONSTRAINT promotions_pk PRIMARY KEY (promo_id)
);

DESC promotions
