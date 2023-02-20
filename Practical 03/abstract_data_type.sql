create or replace type ty_name as object
( fname varchar(20), mname varchar(20), lname varchar(20) );

create or replace type ty_address as object
( street varchar(20), city varchar(20), pincode number(10));

Create table customer_adbt
( c_id number(5) primary key, c_name ty_name, c_add ty_address, c_phno number(10) );

insert into customer_adbt values (2,ty_name('Akshay','A','Anpat'),ty_address('Marine Lines','Mumbai',400028),9820173925); 

insert into customer_adbt values (1,ty_name('Tushar','D','Kini'),ty_address('IIT Powai','Mumbai',400076),9892750112); 

insert into customer_adbt values (3,ty_name('Amkit','M','Kansara'),ty_address('Churhgate','Mumbai',400036),9899162616);


select c.c_name.fname from customer_adbt c; 

select c.c_name.fname|| ' ' ||c.c_name.mname name from customer_adbt c;

/*Altering Objects*/

create or replace type ty_student1 as object ( rollno number(5), name varchar(20) );

create table student_adbt1 of ty_student1;

alter type ty_student1 add attribute 
( course varchar(5), feepaid number(6) ) cascade;

insert into student_adbt1 values(3,'ccc','BCA',2000); 
insert into student_adbt1 values(4,'ddd','BMM',3000); 
insert into student_adbt1 values(5,'hhh','BCA',80000); 
insert into student_adbt1 values(6,'lll','BMM',30000);
