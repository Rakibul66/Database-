create database labexercise_03;
create table teacher
(
	tid int primary key,
	firstname varchar(50) null,
	lastname varchar(50) null,
	dept varchar(50) null,
	age int null,
	salary int null

)

create table student
(
	sid int primary key,
	name varchar(50) null,
	dept varchar(50) null,
	semester varchar(50) null,
	coursecode varchar(50) null,
	age int null,
	credittaken float null,
	teacherid int foreign key references teacher(tid)

)

insert into teacher(tid,firstname,lastname,dept,age,salary)
values(1,'Meraj','Ali','CSE',25,30000),
(2,'Sanjir','Shishir','CSE',24,31000),
(3,'Moshiur','Rahman','EEE',23,29000),
(4,'Symun','Islam','EEE',24,36000),
(5,'Sazzed','Islam','ECE',22,28000),
(6,'Samia','Sultana','CSE',26,38000),
(7,'Arifa','Ferdoushi','ECE',30,50000)


insert into student(sid,name,dept,semester,coursecode,age,credittaken,teacherid)
values(1,'Noor','CSE','7th','CSE-313',22,3,1),
(2,'Arko','EEE','6th','EEE-231',21,4,7),
(3,'Ratul','ECE','8th','ECE-341',23,3,5),
(4,'Toru','EEE','5th','EEE-221',20,4,4),
(5,'Rashmi','CSE','7th','CSE-314',23,1,1),
(6,'Sanjida','ECE','6th','ECE-231',22,3,7),
(7,'Manun','CSE','7th','ECE-316',24,4,null)

--problem_1

select firstname,lastname,teacher.dept,salary,semester,coursecode,credittaken 
from student,teacher where teacherid = tid and credittaken>1;

--problem_2

select count(sid) as Number_of_student,sum(credittaken) 
as Total_Credit,(firstname+space(2)+lastname) as Teacher_Name,student.dept,salary
from student,teacher where teacherid = tid and salary is not null group by 
(firstname+space(2)+lastname),student.dept,salary;

--problem_3

select firstname,lastname,teacher.dept,salary,student.coursecode,
student.credittaken from teacher left join student 
on  teacherid = tid where  salary between 30000 and 40000;


--problem_4

select firstname,teacher.dept,salary,semester,coursecode,credittaken from
teacher left join student on teacherid = tid ;

--problem_5

select firstname,teacher.dept,salary,semester,coursecode,credittaken 
from teacher,student  where teacherid = tid order by semester asc;

--problem_6

select firstname,teacher.dept,salary,semester,coursecode,credittaken 
from teacher,student  where teacherid = tid order by credittaken desc;

--problem_7

select * from student;
delete from student from teacher inner join student on teacherid = tid 
where name='Arko' and semester = '6th';

--problem_8

select * from teacher;
delete from teacher where firstname='Arifa' --[Need to Cascade];

--problem_9

select max(salary) as TotalSalary,firstname,credittaken,teacher.dept from student,teacher
where coursecode like '%31' group by firstname,credittaken,teacher.dept;

--problem_10

delete from student where age = 21;

--problem_11
--problem

SELECT  MAX(salary) AS salary
  FROM Teacher
 WHERE salary < (SELECT MAX(salary)
                 FROM teacher); 


