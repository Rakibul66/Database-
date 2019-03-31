create table salesman(
salesman_id int primary key,
name varchar(20),
city varchar(20),
commission float)

create table customer(
customer_id int primary key,
cust_name varchar(20),
city varchar(20),
grade int null,
salesman_id int foreign key references salesman(salesman_id))

create table orders(
ord_no int,
purch_amt float,
ord_date datetime,
customer_id int foreign key references customer(customer_id),
salesman_id int foreign key references salesman(salesman_id))


insert into Salesman(salesman_id,name,city,commission) values (5001,'james Hoog','new York',0.15)
,(5002,'Nail Knite','paris',0.13),(5005,'pit Alex','London',0.11),(5006,'McLyon','Paris',0.14),
(5003,'Lauson Hen','',0.12),(5007,'Paul Adam','Rome',0.13)

insert into customer(customer_id,cust_name,city,grade,salesman_id) values (3002,'NickRimando','new York',100,5001)
,(3005,'Graham Zushi','calfornia',200,5002),(3001,'Brad Guzan','London',null,5005),
(3004,'Fabian johnas','paris',300,5006),(3007,'Brad devis','new York',200,5001),(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','London',300,5002),(3003,'Jozyaltidor','moscow',200,5007)

insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id) values (70001,150.1,'2015-10-05',3005,5002)
,(70009,270.65,'2012-09-10',3001,5005),(70002,65.26,'2013-10-05',3002,5002),(70004,110.5,'2014-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),(70005,2400.6,'2012-07-27',3007,5001),(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),(70003,2480.4,'2018-10-10',3009,5003),(70012,250.45,'2012-06-27',3009,5002),
(70011,75.29,'2012-08-17',3003,5007),(70013,3045.6,'2011-04-25',3002,5001)

--01
CREATE VIEW newyork
AS SELECT *
FROM salesman
WHERE city = 'New York';

select * from newyork

--2
CREATE VIEW salesown
 AS SELECT salesman_id, name, city
 FROM salesman;

 --03

CREATE VIEW newyorkstaff
AS SELECT *
FROM salesman
WHERE city = 'New York';

--to view
SELECT *
FROM newyorkstaff
WHERE commission > .13;


--04
--create view
CREATE VIEW gradecount (grade, number)
AS SELECT grade, COUNT(*)
FROM customer
GROUP BY grade;

--to view
SELECT *
 FROM gradecount
WHERE number = 2;

--05

create view totalday
 as select customer_id, ord_date,count(ord_no) as order_no ,COUNT(DISTINCT salesman_id) as salseman_id,
 AVG(purch_amt) as avg_purch_amount, SUM(purch_amt) as Sum_purch_amount
 from orders
 GROUP BY  customer_id,ord_date;	


 select*from totalday


 --06
 create view nameoforders
as select ord_no, purch_amt, a.salesman_id, name, cust_name
from orders a, customer b, salesman c
where a.customer_id = b.customer_id
AND a.salesman_id = c.salesman_id;

 SELECT *
 FROM nameoforders
 WHERE name = 'McLyon';

--

--07.
CREATE VIEW elitsalesman
AS SELECT b.ord_date, a.salesman_id, a.name
FROM salesman a, orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt =
    (SELECT MAX (purch_amt)
       FROM orders c
       WHERE c.ord_date = b.ord_date);


	 --08

	

	 create view vwEmployeeSalaryDetails
 as select city ,COUNT(purch_amt) as numberofamt ,
 AVG(purch_amt) as avg_purch_amount, SUM(purch_amt) as Sum_purch_amount
 from orders,salesman
 GROUP BY city;	
 select *from vwEmployeeSalaryDetails

 --09


 	CREATE VIEW VW_EMPLOYEEDETAILS
AS
SELECT
O.PURCH_AMT,
(SELECT NAME FROM SALESMAN WHERE SALESMAN_ID = O.SALESMAN_ID) AS [NAME] ,
(SELECT CITY FROM CUSTOMER WHERE CUSTOMER_ID = O.CUSTOMER_ID) AS [CITY],
(SELECT CUST_NAME FROM CUSTOMER WHERE CUSTOMER_ID =O.CUSTOMER_ID) AS [CUSTOMER],
ORD_DATE
FROM ORDERS O
WHERE O.ord_date BETWEEN '2012/09/10' AND '2013/10/05'


select * from  vw_EmployeeDetails  

--12

	create view spEmployeeSalaryDetails
	 select name, salary, DeptName, Gender each department
	   --14

	   CREATE VIEW incentive
AS SELECT DISTINCT salesman_id, name
FROM elitsalesman a
WHERE 3 <=
   (SELECT COUNT (*)
    FROM elitsalesman b
    WHERE a.salesman_id = b.salesman_id);

	   --15

	   CREATE VIEW highgrade
  AS SELECT *
  FROM customer
  WHERE grade =
    (SELECT MAX (grade)
     FROM customer);

	   --16

	   CREATE VIEW citynum
AS SELECT city, COUNT (DISTINCT salesman_id) as sals_id
FROM salesman
GROUP BY city;

	   --17

	   CREATE VIEW norders
AS SELECT name, AVG(purch_amt) as avg_purch_amt, SUM(purch_amt) as sum_amt
FROM salesman, orders
WHERE salesman.salesman_id = orders.salesman_id
GROUP BY name;
  
  --18.

  CREATE VIEW mcustomer
AS SELECT *
FROM salesman a
WHERE 1 <
   (SELECT COUNT(*)
     FROM customer b
     WHERE a.salesman_id = b.salesman_id);

  --19.

  CREATE VIEW citymatch(custcity, salescity)
AS SELECT DISTINCT a.city, b.city
FROM customer a, salesman b
WHERE a.salesman_id = b.salesman_id;

--to view

 SELECT * FROM citymatch
  
  --20

  CREATE VIEW dateord(ord_date, odcount)
AS SELECT ord_date, COUNT (*)
FROM orders 
GROUP BY ord_date;

  --21

  CREATE VIEW salesmanonoct
AS SELECT *
FROM salesman
WHERE salesman_id IN
    (SELECT salesman_id
         FROM orders
         WHERE ord_date = '2012-10-10');

		
  --22.

  CREATE VIEW sortorder
AS SELECT salesman_id, ord_no, customer_id
FROM orders
WHERE ord_date IN('2012-08-17', '2012-10-10');




--index view

--1.

CREATE VIEW newyork1 with SchemaBinding as 
SELECT salesman_id,name,city,commission
FROM dbo.salesman
WHERE city = 'New York';

--2.
CREATE VIEW salesown1 with SchemaBinding as 
  SELECT salesman_id, name, city
 FROM dbo.salesman;

 --3.
 CREATE VIEW newyorkstaff1 with SchemaBinding as
 SELECT salesman_id, name, city
FROM dbo.salesman
WHERE city = 'New York';

SELECT *
FROM newyorkstaff
WHERE commission > .13;

--04
CREATE VIEW gradecount_index (grade, number) with SchemaBinding 
AS SELECT grade, COUNT(*)
FROM dbo.customer
GROUP BY grade;


--05

create view totalday2 with SchemaBinding 
 as select customer_id, ord_date,count_big(ord_no) as order_no ,COUNT_BIG(DISTINCT salesman_id) as salseman_id,
 AVG(purch_amt) as avg_purch_amount, SUM(purch_amt) as Sum_purch_amount
 from dbo.orders
 GROUP BY  customer_id,ord_date;	

 --06
  create view nameoforders3 with schemaBinding
as select ord_no, purch_amt, a.salesman_id, name, cust_name
from dbo.orders a,dbo. customer b, dbo.salesman c
where a.customer_id = b.customer_id
AND a.salesman_id = c.salesman_id;

 SELECT *
 FROM nameoforders
 WHERE name = 'McLyon';


 --07

 CREATE VIEW elitsalesman2 with SchemaBinding
AS SELECT b.ord_date, a.salesman_id, a.name
FROM dbo.salesman a, dbo.orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt =
    (SELECT MAX (purch_amt)
       FROM dbo.orders c
       WHERE c.ord_date = b.ord_date);

	   --08

	   
	 create view vwEmployeeSalaryDetails2 with SchemaBinding 
 as select city ,COUNT(purch_amt) as numberofamt ,
 AVG(purch_amt) as avg_purch_amount, SUM(purch_amt) as Sum_purch_amount
 from dbo.orders,dbo.salesman
 GROUP BY city;	
 select *from vwEmployeeSalaryDetails

 Sp_helptext vwEmployeeSalaryDetails

 --9
  	CREATE VIEW VW_EMPLOYEEDETAILS3 with SchemaBinding  
AS
SELECT
O.PURCH_AMT,
(SELECT NAME FROM dbo.SALESMAN WHERE SALESMAN_ID = O.SALESMAN_ID) AS [NAME] ,
(SELECT CITY FROM dbo.CUSTOMER WHERE CUSTOMER_ID = O.CUSTOMER_ID) AS [CITY],
(SELECT CUST_NAME FROM dbo.CUSTOMER WHERE CUSTOMER_ID =O.CUSTOMER_ID) AS [CUSTOMER],
ORD_DATE
FROM dbo.ORDERS O
WHERE O.ord_date BETWEEN '2012/09/10' AND '2013/10/05'


