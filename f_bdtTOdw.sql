DELETE FROM exceptions;

DELETE FROM f_dw_ventes;
DELETE FROM f_dw_date;
DELETE FROM f_dw_customer;
DELETE FROM f_dw_produit;
DELETE FROM f_dw_clerk;

-- Désactivation des contraintes et index

ALTER TABLE f_dw_ventes DISABLE CONSTRAINT f_dw_ventes_fkcard;
ALTER TABLE f_dw_ventes DISABLE CONSTRAINT f_dw_ventes_fkdat;
ALTER TABLE f_dw_ventes DISABLE CONSTRAINT f_dw_ventes_fkclerk;
ALTER TABLE f_dw_ventes DISABLE CONSTRAINT f_dw_ventes_fkjolitre;

ALTER TABLE f_dw_date DISABLE CONSTRAINT f_dw_date_pk;
ALTER TABLE f_dw_customer DISABLE CONSTRAINT f_dw_customer_pk;
ALTER TABLE f_dw_produit DISABLE CONSTRAINT f_dw_produit_pk;
ALTER TABLE f_dw_clerk DISABLE CONSTRAINT f_dw_clerk_pk;

DROP INDEX f_dw_date_idx;
DROP INDEX f_dw_customer_idx;
DROP INDEX f_dw_produit_idx;
DROP INDEX f_dw_clerk_idx;

-- Insertion

INSERT INTO f_dw_customer(card_num,dob,adress,secteur,gender,occupation,house)
SELECT cu.getCardNum(), cu.getDob(), cu.getAdress(), cu.getSecteur(), cu.getGender(), cu.getOccupation(), cu.getHouse()
FROM f_bdt_customer cu;

INSERT INTO f_dw_produit(reference,price,size,color,type,city_of_prod,sector)
SELECT t.getReference(),t.getPrice(),t.getSize(),t.getColor(),t.getType(),t.getCity(),t.getSector()
FROM f_bdt_produit t;

INSERT INTO f_dw_clerk (clerk_id,experience,gender,store,store_opening,store_city,store_sector)
SELECT cl.getClerk(), cl.getExperience(), cl.getGender(), cl.getStore(), cl.getStoreOpening(), cl.getCity(), cl.getSector()
FROM f_bdt_clerk cl;

INSERT INTO f_dw_date (dat, jds, sem, mon, tri, temp)
SELECT DISTINCT d.getDat(), d.getJds(), d.getSem(), d.getMon(), d.getTri(), d.getTemp()
FROM f_bdt_date d
WHERE t.getDat() IS NOT NULL;

INSERT INTO f_dw_ventes (num_ticket,dat,jolitre,clerk_id,card_num)
SELECT t.getNumTicket(), t.getDat(), t.getJolitre(), t.getClerk(), t.getCardNum()
FROM f_bdt_ventes t;

-- Réactivation des index et contraintes

CREATE INDEX f_dw_date_idx ON f_dw_date(dat);
CREATE INDEX f_dw_clerk_idx ON f_dw_clerk(clerk_id);
CREATE INDEX f_dw_produit_idx ON f_dw_produit(reference);
CREATE INDEX f_dw_customer_idx ON f_dw_customer(card_num)


ALTER TABLE f_dw_date ENABLE CONSTRAINT f_dw_date_pk;
ALTER TABLE f_dw_customer ENABLE CONSTRAINT f_dw_customer_pk;
ALTER TABLE f_dw_produit ENABLE CONSTRAINT f_dw_produit_pk;
ALTER TABLE f_dw_clerk ENABLE CONSTRAINT f_dw_clerk_pk;

ALTER TABLE f_dw_ventes ENABLE CONSTRAINT f_dw_ventes_fkcard;
ALTER TABLE f_dw_ventes ENABLE CONSTRAINT f_dw_ventes_fkdat;
ALTER TABLE f_dw_ventes ENABLE CONSTRAINT f_dw_ventes_fkclerk;
ALTER TABLE f_dw_ventes ENABLE CONSTRAINT f_dw_ventes_fkjolitre;


PROMPT <<f_dw_date>>
SELECT * FROM f_dw_date WHERE ROWNUM=1;
SELECT count(*) FROM f_dw_date;

PROMPT <<f_dw_clerk>>
SELECT * FROM f_dw_clerk WHERE ROWNUM=1;
SELECT count(*) FROM f_dw_clerk;

PROMPT <<f_dw_produit>>
SELECT * FROM f_dw_produit WHERE ROWNUM=1;
SELECT count(*) FROM f_dw_produit;

PROMPT <<f_dw_ventes>>
SELECT * FROM f_dw_ventes WHERE ROWNUM=1;
SELECT count(*) FROM f_dw_ventes;

PROMPT <<f_dw_customer>>
SELECT * FROM f_dw_produit WHERE ROWNUM=1;
SELECT count(*) FROM f_dw_customer;
