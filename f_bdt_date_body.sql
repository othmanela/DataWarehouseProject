CREATE OR REPLACE FUNCTION testDate(d varchar) RETURN date
IS
  vDate date;
BEGIN
  IF REGEXP_LIKE(d,'^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].*$') THEN
    RETURN TO_DATE(d, 'yyyy-mm-dd');
  ELSE
    RETURN NULL;
  END IF;
END;
/

CREATE OR REPLACE TYPE BODY f_bdt_date_type 
IS

MEMBER FUNCTION getDat RETURN date
IS
BEGIN
  RETURN testDate(SELF.dat);
END;

MEMBER FUNCTION getJds RETURN varchar
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'fmday');
END;

MEMBER FUNCTION getSem RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'ww');
END;

MEMBER FUNCTION getMon RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'mm');
END;

MEMBER FUNCTION getTri RETURN number
IS
BEGIN
  RETURN CEIL(TO_CHAR(self.getDat(),'mm') / 3);
END;

MEMBER FUNCTION getTemp RETURN number
IS
BEGIN
  RETURN temp;
END;

END;