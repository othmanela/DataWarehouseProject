
CREATE TABLE f_bde_store (
store varchar(7),
store_opening varchar(10),
store_city varchar(20),
store_sector varchar(20)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY NF26P028SRC1
ACCESS PARAMETERS
(
RECORDS DELIMITED BY '\n'
CHARACTERSET UTF8
BADFILE NF26P028TMP:'store.csv.bad'
LOGFILE NF26P028TMP:'store.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('Card'))-- name file
REJECT LIMIT UNLIMITED;

SELECT * FROM f_bde_store WHERE ROWNUM=1;
select count(*) from f_bde_store ;
SELECT count(*),max(store),max(store_opening),max(store_city),max(store_sector) FROM f_bde_store;