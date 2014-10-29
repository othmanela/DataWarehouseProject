
CREATE TABLE f_bde_ventes (
num_ticket number(8),
dat varchar(10),
jolitre varchar(10),
clerk_id number(4), 
card_num number(8)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY NF26P028SRC1
ACCESS PARAMETERS
(
RECORDS DELIMITED BY '\n'
CHARACTERSET UTF8
BADFILE NF26P028TMP:'ventes.csv.bad'
LOGFILE NF26P028TMP:'ventes.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('DuneCorp'))
REJECT LIMIT UNLIMITED;

SELECT * FROM f_bde_ventes WHERE ROWNUM=1;
select count(*) from f_bde_ventes ;