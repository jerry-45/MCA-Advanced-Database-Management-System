create table Accounts 
( 
    acctno number, 
    custname varchar(23), 
    branch varchar(23), 
    acctbal number 
)
partition by range (acctbal) 
( 
    partition p1 values less than (2000), 
    partition p2 values less than (5000), 
    partition p3 values less than (9999) 
);

insert into Accounts values(1,'Sagar','Bhuvneshwar',5000); 
insert into Accounts values(2,'Arman','Fun Fiesta',9998); 
insert into Accounts values(3,'Shashikala','Airport',7000); 
insert into Accounts values(4,'Chutki','Bhuvneshwar',6000); 
insert into Accounts values(6,'Nancy','Bhuvneshwar',2000); 
insert into Accounts values(5,'Maansi','THANE',80);

select * from Accounts;

select * from Accounts partition (p1); 

SELECT* FROM ACCOUNTS PARTITION(P1);

alter table Accounts merge Partitions p1,p2 into partition p6; 
alter table Accounts add partition p4 values less than (9999); 

select * from user_tab_partitions where table_name ='ACCOUNTS'; 

alter table Accounts drop partition p3; 

select * from Accounts where acctbal between 5000 and 7000; 

update Accounts set acctbal = acctbal+(acctbal*7/100) where acctbal<=100;