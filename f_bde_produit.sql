CREATE TABLE f_bde_produit (
reference varchar(10),
price number(4),
size number(2),
color varchar(7), 
type varchar(12), 
city_of_prod varchar(20),
sector varchar(20)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER 
DEFAULT  DIRECTORY NF26P028SRC2
ACCESS PARAMETERS 
(
RECORDS DELIMITED BY '\n'
CHARACTERSET UTF8
BADFILE NF26P028TMP:'produit.csv.bad'
LOGFILE NF26P028TMP:'produit.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)

LOCATION ('Jolitres'))
REJECT LIMIT UNLIMITED;
select count(*) from f_bde_produit;
select * from f_bde_produit where rownum = 1;
