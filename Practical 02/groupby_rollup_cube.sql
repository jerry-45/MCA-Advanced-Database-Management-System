/*
The CUBE extension will generate subtotals for all combinations of the dimensions specified. If "n" 
is the number of columns listed in the CUBE, there will be 2n subtotal combinations.
*/

create table studet(Year char(10),rollno number,marks number);

insert into studet values('FY',1,200);
 insert into studet values('FY',2,300);
 insert into studet values('FY',3,250);
 insert into studet values('SY',1,400);
 insert into studet values('SY',2,200);
 insert into studet values('SY',3,210);
 insert into studet values('TY',1,350);
 insert into studet values('TY',2,450);
 insert into studet values('TY',3,500);


SELECT year,rollno,sum(marks)
FROM   studet
GROUP BY CUBE (year,rollno)
ORDER BY year,rollno;


SELECT year,rollno,sum(marks)
FROM   studet
GROUP BY rollup (year,rollno)
ORDER BY year,rollno;


/*Unbounded Preceding and following */
select category ,Title , price, min(price) over (ORDER BY category ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) 
Min_BEFORE, MAX(price )over(ORDER BY category ROWS BETWEEN 1 FOLLOWING AND UNBOUNDED FOLLOWING)MAX_AFTER from catalog1;


