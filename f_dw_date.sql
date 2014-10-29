CREATE TABLE f_dw_date (
dat date,      
jds varchar(10),
sem number(2),
mon number(2),
tri number(1),
temp number(3)
);

CREATE UNIQUE INDEX f_dw_date_idx ON f_dw_date(dat);

ALTER TABLE f_dw_date
ADD CONSTRAINT f_dw_date_pk PRIMARY KEY (dat);
