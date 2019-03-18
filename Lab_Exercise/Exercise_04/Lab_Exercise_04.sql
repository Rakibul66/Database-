create database Lab_Exercise_04;

create table worker
(
	wid int primary key,
	firstname varchar(50) null,
	lastname varchar(50) null,
	salary int null,
	joining_date datetime null,
	dept varchar(50) null

)

create table bonus
(
	wid int foreign key references worker(wid),
	bonus_date datetime null,
	bonus_amount int null,

)

create table title
(
	wid int foreign key references worker(wid),
	title varchar(50) null,
	affected_from datetime null

)


insert into worker(wid,firstname,lastname,salary,joining_date,dept)
values(1,'Rana','Hamid',100000,'2014-02-20 09:00:00','HR'),
(2,'Sanjoy','Saha',80000,'2014-06-11 09:00:00','Admin'),
(3,'Mahmudul','Hasan',300000,'2014-02-20 09:00:00','HR'),
(4,'Asad','Zaman',500000,'2014-02-20 09:00:00','Admin'),
(5,'Sajib','Mia',500000,'2014-06-11 09:00:00','Admin'),
(6,'Alamgir','Kabir',200000,'2014-06-11 09:00:00','Account'),
(7,'Foridul','Islam',75000,'2014-01-20 09:00:00','Account'),
(8,'Keshob','Ray',90000,'2014-04-11 09:00:00','Admin')


insert into bonus(wid,bonus_date,bonus_amount)
values(1,'2016-02-20 00:00:00',5000),
(2,'2016-06-11 00:00:00',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500),
(5,'2016-06-12 00:00:00',null)

insert into title(wid,title,affected_from)
values(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst. Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00')



--problem_1

select firstname,lastname,salary,joining_date,dept,title,bonus_amount,title 
from worker left join bonus on worker.wid = bonus.wid
left join title on bonus.wid = title.wid
where title = 'Executive' ;


--problem_2

select firstname,lastname,salary,joining_date,dept,a.title,bonus_amount,a.title 
from worker,bonus,title a,title b 
where worker.wid = b.wid
and worker.wid = a.wid
and worker.wid = bonus.wid
and a.title = b.title

--problem_3

select firstname,lastname,salary,joining_date,dept,bonus_amount,a.title 
from worker,bonus,title a,title b 
where worker.wid = b.wid
and worker.wid = a.wid
and worker.wid = bonus.wid
and a.title = b.title
and bonus_amount is not null;

--problem_4

select firstname  as worker_name from worker;


--problem_5

select upper(firstname) as firstname from worker;

--problem_6

select distinct dept from worker;

--problem_7

select substring(firstname,0,4) from worker;

--problem_8

select * from worker,bonus,title 
where datename(month,joining_date) = 'February' 
and year(joining_date) = 2014
and worker.wid = bonus.wid
and bonus.wid = title.wid


--Extra
select year(joining_date) from worker;
select month(joining_date) from worker;
select day(joining_date) from worker;
select datename(month,joining_date) from worker;
select datename(day,joining_date) from worker;
--DateDiff() is used to get difference between two dates.


--problem_9

update worker 
set salary = salary+1000
from worker left join title
on worker.wid = title.wid
where title = 'Manager'



--12
SELECT POSITION('a' IN 'Alomgir') FROM Worker;
--13
Select RTRIM(firstname) from Worker;

--14
--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(dept) FROM Worker;

--15
Select distinct len(dept) from Worker;

--16
SELECT REPLACE(firstname, 'a','A') FROM Worker;

--17
SELECT CONCAT(firstname,'',lastname) AS COMPLETE_NAME FROM Worker;

--18
select * from worker order by firstname asc 

--19
select * from worker order by firstname asc , dept desc

--20
Select * from Worker where firstname in ('Rana','Sajib');
SELECT * FROM Worker WHERE firstname = 'roxy' OR firstname = 'anika';
--21
Select * from Worker where firstname not in ('Rana','Sajib');

--22.

Select * from Worker where dept like 'Admin%';

--23
Select * from Worker where firstname like '%a%';
--
--24.
select *from worker where firstname like '%l'

--25.
Select * from Worker where firstname like '______r';

--26
Select * from Worker where SALARY between 100000 and 500000;

--27.
SELECT COUNT(*) FROM worker WHERE dept = 'Admin';

--28.
SELECT CONCAT(firstname, ' ', lastname) As Worker_Name, Salary
FROM worker 
WHERE wid IN 
(SELECT wid FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);



--29.
SELECT Dept, count(wid) No_Of_Workers 
FROM worker 
GROUP BY dept
ORDER BY No_Of_Workers DESC;

--30.

SELECT DISTINCT W.firstname, T.title
FROM Worker W
INNER JOIN title T
ON W.wid = T.wid
AND T.title in ('Manager');

--31.

SELECT title, affected_from, COUNT(*)
FROM Title
GROUP BY title, affected_from
HAVING COUNT(*) > 1;

--32.

--33.


--34

SELECT * INTO WorkerClone FROM Worker;

--35

(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

--36

SELECT * FROM Worker
MINUS
SELECT * FROM Title;


--37.

select getdate() as currentdatetime

--38.

SELECT * FROM Worker ORDER BY Salary DESC LIMIT 10

select wid,firstname,lastname,salary from worker e1 
where &n >(select count(e2.salary) from worker e2 where e1.salary<e2.salary) order by 3 desc;
--39
select wid,firstname,lastname,salary from worker e1 
where (select count(e2.salary) from worker e2 where e1.salary<e2.salary) =&n;

--40

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );

--41


Select distinct W.wid, W.firstname, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.wid != W1.wid;

--42.
select max(salary) from worker where salary not in (select max(salary) from worker);

--43.

select firstname, dept from worker W where W.dept='HR' 
union all 
select firstname, dept from Worker W1 where W1.dept='HR';

--44.

(SELECT * FROM Worker)
INTERSECT 
(SELECT * FROM WorkerClone);

--45.
select TOP 50 PERCENT * FROM worker;

--46

SELECT dept, COUNT(wid) as 'Number of Workers' FROM Worker GROUP BY dept HAVING COUNT(wid) < 5;

--47.

SELECT  COUNT(dept) as 'Number of Workers' FROM Worker GROUP BY dept;
--48.

Select * from Worker where wid = (SELECT max(wid) from Worker);
--49.

Select * from Worker where wid = (SELECT min(wid) from Worker);

--50.

SELECT * FROM Worker WHERE wid <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by w.wid DESC) AS W1 WHERE W1.wid<=5;

--51.

SELECT t.dept,t.firstname,t.Salary from(SELECT max(Salary) as TotalSalary,dept from Worker group by dept) as TempNew 
Inner Join Worker t on TempNew.dept=t.dept
 and TempNew.TotalSalary=t.Salary;

--52
select distinct salary from worker a where 3>=(select count(distinct salary) from worker b where a.salary <=b.salary) order by a.salary desc


--53.

SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;

--54.

SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

--55.

SELECT dept, sum(Salary) from worker group by dept;

--56.

SELECT firstname, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);