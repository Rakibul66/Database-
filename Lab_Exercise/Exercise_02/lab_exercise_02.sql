create database lab_exercise_02

create table teachers
(

	tid int primary key,
	firstname varchar(50) null,
	lastname varchar(50) null,
	dept varchar(20) null,
	age int null,
	salary float not null


)

create table student
(

	sid int primary key,
	name varchar(50) not null,
	dept varchar(20) null,
	semester varchar(20) null,
	coursecode varchar(20) null,
	age int null,
	credittaken float null,
	teacherid int foreign key references teachers(tid)

)


insert into teachers(tid,firstname,lastname,dept,age,salary)
values(1,'Meraj','Ali','CSE',25,30000),
(2,'Sanjir','Shishir','CSE',25,31000),
(3,'Moshiur','Rahman','EEE',25,32000),
(4,'Faruk','Rahman','EEE',24,29000),
(5,'Ashraful','Islam','CSE',24,32000)

insert into student(sid,name,dept,semester,coursecode,age,credittaken,teacherid)
values(1,'Amit','CSE','7th','CSE-313',22,3,1),
(2,'Siam','EEE','8th','EEE-316',21,3,4),
(3,'Anik','CSE','6th','CSE-212',23,4,5),
(4,'Niem','CSE','7th','CSE-313',22,3,1),
(6,'Al-Amin','EEE','7th','EEE-316',22,3,2),
(7,'Rony','EEE','6th','EEE-212',21,4,3)

--problem_1

select firstname,teachers.dept,name,coursecode,salary from teachers,student where 
salary>31000 and student.teacherid = teachers.tid ;

--problem_2

select teachers.firstname,student.name from teachers,student where 
firstname like '%ra%' and teacherid = tid;

--problem_3

select firstname from teachers;
select firstname as FULLNAME from teachers;

--problem_4

select name,student.dept,coursecode,(firstname+space(2)+lastname) as FULLNAME  
from teachers,student where len(lastname)=5 and teacherid = tid;

--problem_5

select max(salary) from teachers where 
salary not in (select max(salary) from teachers) ;
select max(salary) from teachers where 
salary < (select max(salary) from teachers) group by dept;

--problem_6

select max(salary) from teachers where salary <(select max(salary) 
from teachers where salary<(select max(salary) from teachers));

--problem_7

select firstname,count(sid) as Number_of_Student,sum(credittaken) as Total_Credit
from teachers,student where teacherid = tid group by firstname order by 
Total_Credit asc;   

--problem_8

select name,credittaken from student where 
credittaken = (select max(credittaken) from student) or 
credittaken = (select min(credittaken) from student) ; 

--problem_9

select top 100 tid,sid from student,teachers where tid%2!=0 and sid%2!=0;

--problem_10

select firstname,dept,salary as TotalSalary from teachers 
where salary = (select max(salary) from teachers) and dept like 'C%';

--problem_11

select name,(firstname+space(2)+lastname) as FullName ,student.dept  
from student,teachers where student.age>15 and 
teachers.age>15 and teacherid = tid order by dept;

--problem_13

delete from Student where age<22;

--problem_14

select (firstname+' '+lastname) as Full_Name,salary,dept from teachers where 
salary>(select min(salary) from teachers where teachers.dept = 'CSE' ) or 
(salary>(select min(salary) from teachers where teachers.dept = 'CSE' ));

------


select max(salary) from teachers;
select min(salary) from teachers;
select sum(salary) from teachers;
select avg(salary) from teachers;
select count(salary) from teachers;

select teachers.firstname,student.name from teachers,student where 
firstname like '%r' and teacherid = tid; 


