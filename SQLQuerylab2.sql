Create Database LabTwo

create table Borrower
(

	customer_name varchar(50) ,
	loan_number int 
	


)
create table Depositor(
customer_name varchar(50),
Account_no int)

create table loan(
loan_number int,
branch_name varchar(50),amount int)

create table Branch(Branch_name char(30),Branch_city char(30),assets int)


select * from Branch

--1.
select customer_name from Depositor union 
select customer_name from Borrower
--2
select customer_name from Depositor 
except  select customer_name from Borrower

--3
select customer_name from Depositor intersect
select customer_name from Borrower


--4

select Borrower.customer_name,loan.amount from Borrower,loan where Borrower.loan_number=loan.loan_number and amount<28000

--5
select Branch_name from Branch where assets>all(select assets from Branch where Branch_name='Dhanmondi')  

--6  pay 
update Branch set assets=assets*, where Branch_name='Dhanmondi',Branch_name='Banani' or update Branch 

