
DROP TYPE f_bdt_ventes_type;
CREATE OR REPLACE TYPE f_bdt_ventes_type AS OBJECT (
num_ticket number(8),
dat varchar(10),
jolitre varchar(10),
clerk_id number(4), 
card_num number(8),
MEMBER FUNCTION getNumTicket RETURN number,
MEMBER FUNCTION getDat RETURN date,
MEMBER FUNCTION getJolitre RETURN varchar,
MEMBER FUNCTION getClerk RETURN number,
MEMBER FUNCTION getCardNum RETURN number
);
/

CREATE TABLE f_bdt_ventes OF f_bdt_ventes_type;

/*ALTER TABLE f_bdt_ventes 
ADD CONSTRAINT f_bdt_ventes_fkcard 
FOREIGN KEY (card_num) REFERENCES f_bdt_customer(card_num);

ALTER TABLE f_bdt_ventes 
ADD CONSTRAINT f_bdt_ventes_fkdat 
FOREIGN KEY (dat) REFERENCES f_bdt_date(dat);

ALTER TABLE f_bdt_ventes 
ADD CONSTRAINT f_bdt_ventes_fkclerk 
FOREIGN KEY (clerk_id) REFERENCES f_bdt_clerk(clerk_id);

ALTER TABLE f_bdt_ventes 
ADD CONSTRAINT f_bdt_ventes_fkjolitre 
FOREIGN KEY (jolitre) REFERENCES f_bdt_produit(reference);*/
