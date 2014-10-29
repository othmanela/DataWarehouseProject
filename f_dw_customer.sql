CREATE  TABLE f_dw_customer (
card_num number(8),
dob date,
adress varchar(50),
secteur varchar(50), 
gender varchar(1), 
occupation varchar(50),
house varchar(50)
);

CREATE UNIQUE INDEX f_dw_customer_idx ON f_dw_customer(card_num);

ALTER TABLE f_dw_customer
ADD CONSTRAINT f_dw_customer_pk PRIMARY KEY (card_num);
