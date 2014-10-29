
CREATE TABLE f_bde_clerk (
clerk_id number(4),
name varchar(20),
experience number(3),
gender varchar(7),
store varchar(7)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY NF26P028SRC1
ACCESS PARAMETERS
(
RECORDS DELIMITED BY '\n'
CHARACTERSET UTF8
BADFILE NF26P028TMP:'clerk.csv.bad'
LOGFILE NF26P028TMP:'clerk.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('Clerk.csv'))--Nom fichier 
REJECT LIMIT UNLIMITED;

SELECT * FROM f_bde_clerk WHERE ROWNUM=1;
select count(*) from f_bde_clerk ;
SELECT count(*),max(clerk_id),max(name),max(experience),max(gender),max(store) FROM f_bde_clerk;