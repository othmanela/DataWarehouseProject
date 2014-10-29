CREATE OR REPLACE TYPE BODY f_bdt_clerk_type 
IS 

MEMBER FUNCTION getClerk RETURN number
IS
BEGIN
  RETURN clerk_id;
END;

MEMBER FUNCTION getExperience RETURN number
IS
BEGIN
  RETURN experience;
END;

MEMBER FUNCTION getGender RETURN varchar
IS
BEGIN
IF SELF.gender == 'Homme' THEN
    RETURN 'M';
ELSEIF SELF.gender == 'Femme'
    RETURN 'F';
  ELSE
    RETURN NULL;
  END IF;
END;

MEMBER FUNCTION getStore RETURN varchar
IS
BEGIN
IF REGEXP_LIKE(TRIM(SELF.store),'^Dune') THEN
    RETURN SELF.store;
  ELSE 
    RETURN NULL;
  END IF;
END;

MEMBER FUNCTION getStoreOpening RETURN date
IS
BEGIN
  RETURN testDate(SELF.store_opening);
END;

MEMBER FUNCTION getCity RETURN varchar
IS
BEGIN
  RETURN store_city;
END;

MEMBER FUNCTION getSector RETURN varchar
IS
BEGIN
  RETURN store_sector;
END;

END;