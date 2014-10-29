CREATE TABLE f_dw_produit (
reference varchar(10),
price number(4),
size number(2),
color varchar(7), 
type varchar(12), 
city_of_prod varchar(20),
sector varchar(20)
);

CREATE UNIQUE INDEX f_dw_produit_idx ON f_dw_produit(reference);

ALTER TABLE f_dw_produit
ADD CONSTRAINT f_dw_produit_pk PRIMARY KEY (reference);