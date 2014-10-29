CREATE  TABLE f_dw_clerk (
clerk_id number(4),
experience number(3),
gender varchar(1),
store varchar(7),
store_opening date,
store_city varchar(20),
store_sector varchar(20)
);

CREATE UNIQUE INDEX f_dw_clerk_idx ON f_dw_clerk(clerk_id);

ALTER TABLE f_dw_clerk
ADD CONSTRAINT f_dw_clerk_pk PRIMARY KEY (clerk_id);
