--create database
Create Database LabOne

--1

create table C_ustomer
(

	Customer_Name varchar(50) ,
	Customer_City varchar(50) not null,
	Customer_Country varchar(50) not null,
	TimeZone varchar(20)  not null,
	AccountNo varchar(20)  not null,
	


)
create table L_oan
(
Customer_Name  varchar(50),
Loan_number varchar(50),Amount int null,)


create table stu_dent
(
Student_Name  varchar(50),
CGPA varchar(50),Session varchar(50),)

insert into C_ustomer(Customer_Name,Customer_City,Customer_Country,TimeZone,AccountNo)
values('Galvin','Athens','Greece','GMT-6','AC452'),('Smith','Easter_Island','Chile','GMT-6','AC857'),('Jony','Athens','USA','GMT-7','AC325'),
('Ronald','Baltimore','USA','GMT-7','AC665')

insert into L_oan(Customer_Name,Loan_number,Amount)
values('Jony','L-174',25000),('Michel','P-857',32000),('Ronald','K-658',12580),('Rakesh','J-582',NULL)

insert into Stu_dent(Student_Name,CGPA,Session)
values('Sara','3.86','Summer15'),('Rakesh','3.24','Summer16'),('Wadud','3.69','Spring14'),('Simran','3.55','Fall13')


--3
select Customer_Name from C_ustomer where Customer_Country='USA' order by Customer_Name;



--4
select Customer_Name from L_oan where Amount>(25000+32000+12580)/3;



					
--5
SELECT COUNT(*)
FROM  C_ustomer;


--
---6
(select Customer_Name from C_ustomer)union(select Customer_Name from  L_oan);

---8

(select Customer_Name from C_ustomer)intersect(select Customer_Name from  L_oan);

--9
select Student_name,CGPA from  stu_dent	where CGPA between 3.50 and 3.99;

