create table patient 
( 
patno varchar(10), 
pname varchar(20), 
opd_date date, 
charges number 
)
partition by range(opd_date) 
( 
partition d1 values less than('01-jan-2008'), 
partition d2 values less than('31-Mar-2008'), 
partition d3 values less than('01-Apr-2008'), 
partition d4 values less than('30-jun-2008'), 
partition d5 values less than('01-jul-2008'), 
partition d6 values less than('30-sep-2008'), 
partition d7 values less than('01-oct-2008'), 
partition d8 values less than('31-Dec-2008') 
);

insert into patient values('p1', 'Anil','31-dec-2007',1000); 
insert into patient values('p2', 'Amit','31-jan-2008',2000); 
insert into patient values('p3', 'Aditya','26-mar-2008',3000); 
insert into patient values('p4', 'Upendra','30-may-2008',1500); 
insert into patient values('p5', 'Vrushali','30-jun-2008',4000);

alter table Patient  add partition d9 values less than ('31-jan-2009');

select * from patient where opd_date >='1-jan-2008' and opd_date <=' 26-mar-2008';
