@raz.sql
@exceptions.sql
PROMPT
PROMPT ************************** BDE **************************
@f_bde.sql
PROMPT
PROMPT ************************** BDT **************************
@f_bdt.sql

PROMPT 
PROMPT ************************** DW **************************
@f_dw.sql



PROMPT
PROMPT ************************** BDE TO BDT**************************
@f_bdeTObdt.sql
commit;


PROMPT
PROMPT ************************** BDT TO DW**************************
@f_bdtTOdw.sql
commit;
