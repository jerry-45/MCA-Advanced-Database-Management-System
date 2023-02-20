create table employee 
( 
empid varchar(10), 
empno varchar(20), 
deptno varchar(10), 
salary number(7) 
);

insert into employee values('1000', 'Ajay singh', 'PD', 15000); 
insert into employee values('1001', 'Bharti Shetty', 'QC', 25000); 
insert into employee values('1002', 'sheetal Roy', 'PD', 35000); 
insert into employee values('1003', 'Meena Powar', 'Support', 30000); 
insert into employee values('1004', 'Rajlakxhmi Pai', 'Support', 40000); 
insert into employee values('1005', 'Vaibhav Vaidya', 'QC', 50000); 
insert into employee values('1006', 'Nagveni', 'QC', 50000); 
insert into employee values('1007', 'Pramod jaiswal', 'QC', 55000);

select * from employee;

/*RANK*/

select empid, deptno, salary, RANK() OVER (PARTITION BY deptno ORDER BY salary)"rank" from employee;

/*DENSE RANK*/

select empid, deptno, salary, DENSE_RANK() OVER (PARTITION BY deptno ORDER BY salary)"rank" from employee;

select empid, deptno, salary, DENSE_RANK() OVER (ORDER BY salary desc)"rank" from employee;

/*SECOND LOWEST SALARY*/

select a.empid ,a.deptno ,a.salary from 
( 
select empid,deptno,salary, 
dense_rank() over ( order by salary desc ) as rk 
from employee 
) a where a.rk=2;

/*THIRD LOWEST SALARY*/

select a.empid ,a.deptno ,a.salary from 
( 
select empid,deptno,salary, 
dense_rank() over ( order by salary ) as rk 
from employee 
) a where a.rk=3;

/*To view for deptno wise */

select a.empid ,a.deptno ,a.salary from 
( 
select empid,deptno,salary, 
dense_rank() over ( partition by deptno order by salary ) as rk 
from employee 
) a where a.rk=3;

/*LEAD*/

select empid, deptno, salary, LEAD(salary, 1) OVER (ORDER BY salary) AS "NextSalary" from employee where deptno='QC';

/*LAG*/

select empid, deptno, salary, LAG(salary, 1) OVER (ORDER BY salary) AS "PreSalary" from employee where deptno='QC'; 

select empid, deptno, salary, min(salary) KEEP (DENSE_RANK FIRST ORDER BY salary) OVER (PARTITION BY deptno)"Lowest",max(salary) KEEP (DENSE_RANK LAST ORDER BY salary) OVER (PARTITION BY deptno)"Highest" FROM employee ORDER BY deptno, salary;