create table tblEmp(
EmpID int,
EmpName varchar(50),
EmpSalary int,
EmpJoinDate date
)

create table students(
ID int,
Distrit varchar(50),
Dept varchar(50)
)

create table Industry(
Industry varchar(50),
Industry_Code int,
Employee int,
Annual_income int
)

create table salesman
(
salesman_id int,
name varchar(50),
city varchar(50),
commission float,
)

create table customer
(
customer_id int,
cust_name varchar(50),
city varchar(50),
grade int,
salesman_id int,
)

insert into tblEmp values(02345,'Rasel',25000,'2018-01-01'),
(02452,'Nishan',15000,'2018-05-15'),
(02666,'Munira',32000,'2019-01-15'),
(02788,'Sadia',45000,'2019-02-20')

insert into students values(02345,'Dhaka','IT'),
(02666,'Rajshahi','IT'),
(03562,'Rajshahi','HR'),
(02587,'Rajshahi','PO')

insert into Industry values('ACI',1234,200,150),
('Sk-F',3254,150,2563),
('RFL',1489,117,4857),
('GMGAirlines',2541,253,3350)

insert into salesman(salesman_id,name,city,commission)
values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson hen',null,0.12),
(5007,'Paul Adam','Rome',0.13);

insert into customer(customer_id,cust_name,city,grade,salesman_id)
values(3002,'Nick Rimando','New York',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guzan','London',200,5005),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New York',200,5001),
(3009,'Geoff Camero','Berlin',100,5003),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moscow',200,5007);

--1.
create view EmpDetail 
as
select EmpName,EmpSalary from tblEmp where EmpName like '%a%' and EmpSalary between 15000 and 20000;

 

select * from EmpDetail;
--5
CREATE VIEW newyorkstaff
AS SELECT *
FROM salesman
WHERE city = 'New York';

--to view more than 13
SELECT *
FROM newyorkstaff
WHERE commission > .13;

--problem_3
create view vw_count
as
select count(customer_id) as Num_of_Customer,grade
from customer
where grade is not null
group by grade;

 


select * from vw_count;


--2

create view vw_emp
as
select EmpName,EmpID,EmpSalary,Dept from tblEmp join students on EmpID=ID;

--update
 update vw_emp
set Dept = 'accounts'
where EmpName = 'Rasel';

select * from vw_emp;

--4

create Index I_clust 
on industry(Industry_code);

select* from Industry