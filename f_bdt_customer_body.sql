CREATE OR REPLACE TYPE BODY f_bdt_customer_type 
IS 

MEMBER FUNCTION getCardNum RETURN number
IS
BEGIN
  RETURN card_num;
END;

MEMBER FUNCTION getDob RETURN date
IS
BEGIN
  RETURN testDate(dob);
END;

MEMBER FUNCTION getAdress RETURN varchar
IS
BEGIN
    RETURN adress;
END;

MEMBER FUNCTION getSecteur RETURN varchar
IS
BEGIN
  RETURN secteur;
END;

MEMBER FUNCTION getGender RETURN varchar
IS
BEGIN
  RETURN gender;
END;

MEMBER FUNCTION getOccupation RETURN varchar
IS
BEGIN
  RETURN occupation;
END;

MEMBER FUNCTION getHouse RETURN varchar
IS
BEGIN
  RETURN house;
END;

END;