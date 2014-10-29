create or replace
TYPE BODY f_bdt_ventes_type 
IS

MEMBER FUNCTION getJolitre RETURN varchar
IS
  vFk f_bdt_produit.reference%TYPE;
BEGIN
  IF REGEXP_LIKE(TRIM(SELF.jolitre),'^JL') THEN
    SELECT reference INTO vFk
    FROM f_bdt_produit
    WHERE reference=SELF.jolitre;  
    RETURN vFk;
  ELSE 
    RETURN NULL;
  END IF;
END;

MEMBER FUNCTION getClerk RETURN number
IS
  vFk f_bdt_clerk.clerk_id%TYPE;
BEGIN
  SELECT clerk_id INTO vFk
  FROM f_bdt_clerk
  WHERE clerk_id=SELF.clerk_id;  
  RETURN vFk;
END;

MEMBER FUNCTION getCardNum RETURN number
IS
  vFk f_bdt_customer.card_num%TYPE;
BEGIN
  SELECT clerk_id INTO vFk
  FROM f_bdt_customer
  WHERE card_num=SELF.card_num;  
  RETURN vFk;
END;

MEMBER FUNCTION getNumTicket RETURN number
IS
BEGIN
  RETURN SELF.num_ticket;
END;

MEMBER FUNCTION getDat RETURN date
IS
BEGIN
  RETURN testDate(SELF.dat);
END;
END;