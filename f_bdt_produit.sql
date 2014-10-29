
DROP TYPE f_bdt_produit_type;
CREATE OR REPLACE TYPE f_bdt_produit_type AS OBJECT (
reference varchar(10),
price number(4),
size number(2),
color varchar(7), 
type varchar(12), 
city_of_prod varchar(20),
sector varchar(20),
MEMBER FUNCTION getReference RETURN varchar,
MEMBER FUNCTION getPrice RETURN number,
MEMBER FUNCTION getSize RETURN number,
MEMBER FUNCTION getColor RETURN varchar,
MEMBER FUNCTION getType RETURN varchar,
MEMBER FUNCTION getCity RETURN varchar,
MEMBER FUNCTION getSector RETURN varchar
);
/

CREATE TABLE f_bdt_produit OF f_bdt_produit_type;

CREATE UNIQUE INDEX f_bdt_produit_idx ON f_bdt_produit(reference);

ALTER TABLE f_bdt_produit 
ADD CONSTRAINT f_bdt_produit_pk PRIMARY KEY (reference);