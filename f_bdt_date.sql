
DROP TYPE f_bdt_date_type;
CREATE OR REPLACE TYPE f_bdt_date_type AS OBJECT (
dat varchar(10),
temp number(3),     
MEMBER FUNCTION getDat RETURN date,
MEMBER FUNCTION getJds RETURN varchar,
MEMBER FUNCTION getSem RETURN number,
MEMBER FUNCTION getMon RETURN number,
MEMBER FUNCTION getTri RETURN number, 
MEMBER FUNCTION getTemp RETURN number 
);
/
CREATE TABLE f_bdt_date OF f_bdt_date_type;

CREATE UNIQUE INDEX f_bdt_date_idx ON f_bdt_date(dat);-- si test est juste

ALTER TABLE f_bdt_date-- si test est juste
ADD CONSTRAINT f_bdt_date_pk PRIMARY KEY (dat);-- si test est juste

