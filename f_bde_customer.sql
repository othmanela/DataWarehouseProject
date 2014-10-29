CREATE TABLE f_bde_customer (
card_num number(8),
name varchar(20),
dob varchar(10),
adress varchar(50),
secteur varchar(50), 
gender char(1), 
occupation varchar(50),
house varchar(50)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER 
DEFAULT  DIRECTORY NF26P028SRC1
ACCESS PARAMETERS 
(
RECORDS DELIMITED BY '\n'
CHARACTERSET UTF8
BADFILE NF26P028TMP:'customer.csv.bad'
LOGFILE NF26P028TMP:'customer.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)

LOCATION ('Card'))-- Name fichier
REJECT LIMIT UNLIMITED;
select count(*) from f_bde_customer;
select * from f_bde_customer where rownum = 1;
