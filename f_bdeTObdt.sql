DELETE FROM exceptions;

DELETE FROM f_bdt_ventes;
DELETE FROM f_bdt_customer;
DELETE FROM f_bdt_produit;
DELETE FROM f_bdt_clerk;
DELETE FROM f_bdt_date;

-- D?sactivation des contraintes et index

/*ALTER TABLE f_bdt_ventes DISABLE CONSTRAINT f_bdt_ventes_fkcard;
ALTER TABLE f_bdt_ventes DISABLE CONSTRAINT f_bdt_ventes_fkdat;
ALTER TABLE f_bdt_ventes DISABLE CONSTRAINT f_bdt_ventes_fkclerk;
ALTER TABLE f_bdt_ventes DISABLE CONSTRAINT f_bdt_ventes_fkjolitre;*/

ALTER TABLE f_bdt_date DISABLE CONSTRAINT f_bdt_date_pk;--a tester si wrong retirer 
ALTER TABLE f_bdt_customer DISABLE CONSTRAINT f_bdt_customer_pk;
ALTER TABLE f_bdt_produit DISABLE CONSTRAINT f_bdt_produit_pk;
ALTER TABLE f_bdt_clerk DISABLE CONSTRAINT f_bdt_clerk_pk;

DROP INDEX f_bdt_date_idx;-- a tester si wrong retirer !!!!!!!
DROP INDEX f_bdt_customer_idx;
DROP INDEX f_bdt_produit_idx;
DROP INDEX f_bdt_clerk_idx;

-- Insertion

INSERT INTO f_bdt_date (dat,temp)
SELECT dat, temp 
FROM f_bde_data;

INSERT INTO f_bdt_customer(card_num,dob,adress,secteur,gender,occupation,house)
SELECT card_num,dob,adress,secteur,gender,occupation,house
FROM f_bde_customer;

INSERT INTO f_bdt_produit(reference,price,size,color,type,city_of_prod,sector)
SELECT reference,price,size,color,type,city_of_prod,sector
FROM f_bde_produit;

INSERT INTO f_bdt_clerk (clerk_id,experience,gender,store,store_opening,store_city,store_sector)
SELECT c.clerk_id,c.experience,c.gender,c.store,s.store,s.store_opening,s.store_city,s.store_sector
FROM f_bde_clerk c, f_bde_store s
WHERE c.store = s.store;

INSERT INTO f_bdt_ventes (num_ticket,dat,jolitre,clerk_id,card_num)
SELECT num_ticket,dat,jolitre,clerk_id,card_num
FROM f_bde_ventes;

-- R?activation des index et contraintes

CREATE INDEX f_bdt_date_idx ON f_bdt_date(dat);--- si retirer plu tot retirer ici aussi
CREATE INDEX f_bdt_customer_idx ON f_bdt_customer(card_num);
CREATE INDEX f_bdt_produit_idx ON f_bdt_produit(reference);
CREATE INDEX f_bdt_clerk_idx ON f_bdt_clerk(clerk_id);

ALTER TABLE f_bdt_date ENABLE CONSTRAINT f_bdt_date_pk;--a tester si retirer plu tot retirer ici aussi
ALTER TABLE f_bdt_customer ENABLE CONSTRAINT f_bdt_customer_pk;
ALTER TABLE f_bdt_produit ENABLE CONSTRAINT f_bdt_produit_pk;
ALTER TABLE f_bdt_clerk ENABLE CONSTRAINT f_bdt_clerk_pk;

-----ATTENTION A CETTE PARTIE!!!!!!!!!!!!!!!!!!!!!!!!!!!----------------
/*ALTER TABLE f_bdt_ventes ENABLE CONSTRAINT f_bdt_ventes_fkcard;
ALTER TABLE f_bdt_ventes ENABLE CONSTRAINT f_bdt_ventes_fkdat;
ALTER TABLE f_bdt_ventes ENABLE CONSTRAINT f_bdt_ventes_fkclerk;
ALTER TABLE f_bdt_ventes ENABLE CONSTRAINT f_bdt_ventes_fkjolitre;*/

-------------------------------------------------------------------------


--SELECT count(*) FROM exceptions;

-- V?rification sommaire du transfert

SELECT * FROM f_bdt_ventes WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_ventes;

SELECT * FROM f_bdt_customer WHERE ROWNUM=2;
SELECT count(*) FROM f_bdt_customer;

SELECT * FROM f_bdt_produit WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_produit;

SELECT * FROM f_bdt_clerk WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_clerk;

SELECT * FROM f_bdt_date WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_date;
