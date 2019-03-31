create database  Joining2
create table actor
(
act_id int primary key,
act_fname char(20),
act_lname char(20),
act_gender char(1)
)

create table director
(
dir_id int primary key,
dir_fname char(20),
dir_lname char(20)
)

create table movie
(
mov_id int primary key,
mov_title char(50),
mov_year int,
mov_time int,
mov_lang char(50),
mov_dt_rel datetime,
mov_rel_country char(50)
)

create table reviewer
(
rev_id int primary key,
rev_name char(30)
)

create table genres
(
gen_id int primary key,
gen_title char(20)
)
create table movie_direction
(
dir_id int foreign key references director(dir_id),
mov_id int foreign key references movie(mov_id)
)

create table movie_cast
(
act_id int foreign key references actor(act_id),
mov_id int foreign key references movie(mov_id),
role char(30)
)

create table movie_genres
(
mov_id int foreign key references movie(mov_id),
gen_id int foreign key references genres(gen_id)
)

create table rating
(
mov_id int foreign key references movie(mov_id),
rev_id int foreign key references reviewer(rev_id),
rev_stars int,
num_o_rating int

)

insert into actor (act_id	,act_fname       ,	act_lname    ,   	act_gender)
values(101,'James','Stewart','M'),
(102,'Deborah','Kerr', 'F'),
(103,'Peter','OToole','M'),
(104,'Robert','DeNiro', 'M'),
(105,'F.Murray' ,'Abraham','M'),
(106,'Harrison', 'Ford','M'),
(107,'Nicole','Kidman','F'),
(108,	'Stephen',              	'Baldwin',              	'M'),
(109,	'Jack',                 	'Nicholson',            	'M'),
(110,	'Mark',                 	'Wahlberg',             	'M'),
(111,	'Woody',                	'Allen' ,               	'M'),
(112,	'Claire',               	'Danes',                	'F'),
(113,	'Tim',                  	'Robbins',              	'M'),
(114,	'Kevin',                	'Spacey ',              	'M'),
(115,	'Kate ',                	'Winslet',              	'F'),
(116,	'Robin',                	'Williams' ,            	'M'),
(117,	'Jon',                  	'Voight',               	'M'),
(118,	'Ewan',                 	'McGregor',             	'M'),
(119,	'Christian',            	'Bale ',                	'M'),
(120,	'Maggie ',              	'Gyllenhaal',           	'F'),
(121,	'Dev',                  	'Patel',                	'M'),
(122,	'Sigourney ',           	'Weaver',               	'F'),
(123,	'David',                	'Aston ',               	'M')

insert into director(dir_id	,dir_fname , dir_lname)
values(201,	'Alfred',               	'Hitchcock'),
(202,	'Jack ',                	'Clayton'),
(203,   'David',                	'Lean'),
(204,	'Michael',             	'Cimino'),
(205,	'Milos',                	'Forman'),
(206,	'Ridley' ,             	'Scott'),
(207,	'Stanley',              	'Kubrick'),
(208,	'Bryan',                	'Singer'),
(209,	'Roman' ,              	'Polanski'),
(210,	'Paul',                 	'Thomas Anderson'),
(211,	'Woody',                	'Allen'),
(212,	'Hayao',                	'Miyazaki'),
(213,	'Frank ',               	'Darabont'),
(214,	'Sam',                  	'Mendes'),
(215,	'James ',               	'Cameron'),
(216,	'Gus',                  	'Van Sant'),
(217,	'John',                 	'Boorman'),
(218,	'Danny ',               	'Boyle'),
(219,	'Christopher',          	'Nolan'),
(220,	'Richard',              	'Kelly'),
(221,	'Kevin',              	'Spacey'),
(222,	'Andrei',               	'Tarkovsky'),
(223,	'Peter',                	'Jackson')

insert into movie(mov_id,mov_title , mov_year	,mov_time,mov_lang  ,   	mov_dt_rel,	mov_rel_country)
values(901,	'Vertigo',                                            	1958,	128,	'English',         	1958-08-24,	'UK'),
(902,	'The Innocents',                                      	1961,	100	,'English',         	1962-02-19,	'SW'),
(903,	'Lawrence of Arabia',                                 	1962,	216 ,'English',         	1962-12-11,	'UK'),
(904,	'The Deer Hunter',                                    	1978,	183	,'English',         	1979-03-08,	'UK'),
(905,	'Amadeus',                                            	1984,	160	,'English',         	1985-01-07,	'UK'),
(906,	'Blade Runner',                                       	1982,	117 ,'English ',        	1982-09-09	,'UK'),
(907,	'Eyes Wide Shut' ,                                    	1999,	159 ,'English ',        		 Null    ,     ' UK'),
(908,	'The Usual Suspects ',                                	1995,	106	,'English ',        	995-08-25,	'UK'),
(909,	'Chinatown',                                          	1974,	130,'English',         	1974-08-09,	'UK'),
(910,	'Boogie Nights',                                      	1997,	155,'English',         	1998-02-16,	'UK'),
(911,	'Annie Hall',                                         	1977,	93, 'English ',        	1977-04-20,	'USA'),
(912,	'Princess Mononoke ',                                 	1997,	134,'Japanese ',       2001-10-19,	'UK'),
(913,	'The Shawshank Redemption ',                          	1994,	142,'English',         	1995-02-17,	'UK'),
(914,	'American Beauty',                                    	1999,	122,'English',         		  Null     , 'UK'),
(915,	'Titanic',                                            	1997,	194	,'English ',        	1998-01-23,	'UK'),
(916,	'Good Will Hunting',                                  	1997,	126	,'English',         	1998-06-03,	'UK'),
(917,	'Deliverance',                                        	1972,	109,'English',         	1982-10-05,	'UK'),
(918,	'Trainspotting',                                      	1996,	94,	'English',         	1996-02-23	,'UK'),
(919,	'The Prestige ',                                      	2006,	130,'English',         	2006-11-10,	'UK'),
(920,	'Donnie Darko ',                                      	2001,	113	,'English',         		Null      ,  'UK'),
(921,	'Slumdog Millionaire' ,                               	2008,	120	,'English',         	2009-01-09,	'UK'),
(922,	'Aliens',                                             	1986,	137	,'English',         	1986-08-29,	'UK'),
(923,	'Beyond the Sea',                                     	2004,	118, 'English',         	2004-11-26	,'UK'),
(924,	'Avatar',                                             	2009,	162, 'English',         	2009-12-17,	'UK'),
(926,	'Seven Samurai',                                      	1954,	207	,'Japanese',        	1954-04-26,	'JP'),
(927,	'Spirited Away',                                      	2001,	125	,'Japanese',        	2003-09-12,	'UK'),
(928,	'Back to the Future ',                                	1985,	116, 'English',         	1985-12-04,	'UK'),
(925,	'Braveheart ',                                        	1995,	178, 'English' ,             	Null	,'Null')


insert into   reviewer  (rev_id	,rev_name)
values(9001,	'Righty S.ock'),
(9002,	'Jack Malvern'),
(9003,	'Flagrant Baronessa'),
(9004,	'Alec Shaw'),
(9005,	'         '),
(9006,	'Victor Woeltjen'),
(9007,	'Simon Wright'),
(9008,	'Neal Wruck'),
(9009,	'Paul Monks'),
(9010,	'Mike Salvati'),
(9011,	 '           '),
(9012,	'Wesley S. Walker'),
(9013,	'Sasha Goldshtein'),
(9014,	'Josh Cates'),
(9015,	'Krug Stillo'),
(9016,	'Scott LeBrun'),
(9017,	'Hannah Steele'),
(9018,	'Vincent Cadena'),
(9019,	'Brandt Sponseller'),
(9020,	'Richard Adams')


insert into  genres(gen_id,gen_title)
values(1001,	'Action'),
(1002,	'Adventure'),
(1003,	'Animation'),
(1004,	'Biography'),
(1005,	'Comedy'),
(1006,	'Crime'),
(1007,	'Drama'),
(1008,	'Horror'),
(1009,	'Music'),
(1010,	'Mystery'),
(1011,	'Romance'),
(1012,	'Thriller'),
(1013,	'War')

insert into  movie_direction(dir_id,mov_id)
values(201	,901),
(202 , 902),
(203 ,	903),
(204 ,	904),
(205 ,	905),
(206 ,	906),
(207 ,	907),
(208 ,	908),
(209 ,	909),
(210 ,	910),
(211 ,	911),
(212 ,	912),
(213 ,	913),
(214 ,	914),
(215 ,	915),
(216 ,	916),
(217 ,	917),
(218 ,	918),
(219 , 919),
(220 ,	920),
(218 ,	921),
(215 ,	922),
(221 ,	923)


insert into movie_cast(act_id,mov_id,role)
values(101,	901	,'John Scottie Ferguson'),
(102,	902,	'Miss Giddens'),
(103,	903	,'T.E. Lawrence'),
(104,	904,'Michael'),
(105,	905,	'Antonio Salieri'),
(106,	906,	'Rick Deckard'),
(107,	907,	'Alice Harford'),
(108,	908,	'McManus'),
(110,	910,	'Eddie Adams'),
(111,	911,	'Alvy Singer'),
(112,	912,	'San'),
(113,	913,	'Andy Dufresne'),
(115,	915	,'Rose DeWitt Bukater'),
(116,	916,	'Sean Maguire'),
(117,	917,	'Ed'),
(118,	918,	'Renton'),
(120,	920	,'Elizabeth Darko'),
(121,	921,	'Older Jamal0'),
(122,	922	,'Ripley'),
(114,	923,	'Bobby Darin'),
(109,	909	,'J.J. Gittes'),
(119,	919,	'Alfred Borden')


insert into movie_genres(mov_id,	gen_id)
values(922 ,	1001),
(917 ,	1002),
(903 ,	1002),
(912 ,	1003),
(911 ,	1005),
(908 ,	1006),
(913 ,	1006),
(926 , 1007),
(928 ,	1007),
(918 ,	1007),
(921 ,	1007),
(902 ,	1008),
(923 ,	1009),
(907 ,	1010),
(927 ,	1010),
(901 ,	1010),
(914 ,	1011),
(906 ,	1012),
(904 ,	1013)


insert into rating(mov_id,rev_id,rev_stars,num_o_rating)
values(901,	9001,	8.40,	263575),
(902,	9002,	7.90,    	20207 ),
(903,	9003,	8.30,	202778),
(906,	9005,	8.20,	484746),
(924,	9006,	7.30,    Null),
(908,	9007,	8.60,	779489),
(909,	9008,   Null,   227235),
(910,	9009,	3.00,	195961),
(911,	9010,	8.10,	203875),
(912,	9011,	8.40,    Null),	
(914,	9013,	7.00,	862618),
(915,	9001,	7.70,	830095),
(916,	9014,	4.00,	642132),
(925,	9015,	7.70,	81328),
(918,	9016,   Null,	580301),
(920,	9017,	8.10,	609451),
(921,	9018,	8.00,	667758),
(922,	9019,	8.40,	511613),
(923,	9020,	6.70,	13091)

--1
SELECT DISTINCT rev_name 
FROM reviewer 
WHERE rev_id IN (
SELECT rev_id 
FROM rating 
WHERE rev_stars IS NULL);

--2

SELECT  act_fname, act_lname
FROM  actor
SELECT  mov_id 
FROM movie 
WHERE mov_title=('Annie Hall');

--3.
SELECT dir_fname, dir_lname
FROM  director
WHERE dir_id in (
SELECT dir_id 
FROM movie_direction
WHERE mov_id in(
SELECT mov_id 
FROM movie_cast WHERE role = ANY (
SELECT role 
FROM movie_cast 
WHERE mov_id IN (
SELECT  mov_id 
FROM movie 
WHERE mov_title='Eyes Wide Shut'))));

--04
SELECT dir_fname, dir_lname, mov_title
FROM  director 
JOIN movie_direction 
  ON director.dir_id=movie_direction.dir_id
JOIN movie 
  ON movie_direction.mov_id=movie.mov_id
JOIN movie_cast 
  ON movie_cast.mov_id=movie.mov_id
  WHERE role='Sean Maguire';

  --05

  SELECT a.act_fname, a.act_lname, c.mov_title, c.mov_year  
FROM actor a, movie_cast b, movie c  
WHERE a.act_id=b.act_id  
AND b.mov_id=c.mov_id  
AND c.mov_year NOT BETWEEN 1990 and 2000;

--06

SELECT d.dir_fname,d.dir_lname ,g.gen_title,count(g.gen_title)
from director d , movie_direction md , genres g , movie_genres mg
where d.dir_id=md.dir_id
and g.gen_id = mg.gen_id
and mg.mov_id = md.mov_id
group by d.dir_fname , d.dir_lname, g.gen_title
order by 1 , 2 asc ;

--07


select m.mov_title , m.mov_year, g.gen_title
from movie m , genres g , movie_genres mg
where m.mov_id =mg.mov_id
and g.gen_id =mg.gen_id

--08


select m.mov_title , m.mov_year , g.gen_title , d.dir_fname , d.dir_lname
from movie m , genres g , movie_genres mg , director d , movie_direction md
where m.mov_id = mg.mov_id
and g.gen_id = mg.gen_id
and d.dir_id = md.dir_id
and md.mov_id = m.mov_id;

--09
select m.mov_title , m.mov_year , m.mov_time , m.mov_dt_rel ,  d.dir_fname , d.dir_lname
from movie m , director d , movie_direction md
where m.mov_id = md.mov_id
and d.dir_id = md.dir_id
and mov_dt_rel <'01/01/1989' 
order by 4 desc;

--10
select g.gen_title ,  avg(m.mov_time) , count (g.gen_title)
from genres g  , movie m , movie_genres mg
where g.gen_id = mg.gen_id
and mg.mov_id = m.mov_id
group by g.gen_title;

--11

select m.mov_title , min(m.mov_time) , m.mov_year ,  d.dir_fname , d.dir_lname , a.act_fname, a.act_lname, mc.role
from movie m , director d , actor a , movie_cast mc , movie_direction md 
where m.mov_id = mc.mov_id
and md.mov_id = m.mov_id
and d.dir_id = md.dir_id
and mc.act_id = a.act_id 


--12

select distinct m.mov_year from movie m , rating r
where m.mov_id = r.mov_id
and r.rev_stars in (3 ,4)
ORDER BY m.mov_year;

--13


select rw.rev_name,m.mov_title , r.rev_stars
from movie m , rating r ,reviewer rw
where
m.mov_id = r.mov_id
and rw.rev_id = r.rev_id
order by 1 ,2 ,3

--14

SELECT mov_title, MAX(rev_stars)
FROM movie
INNER JOIN rating USING(mov_id)
GROUP BY mov_title 
HAVING MAX(rev_stars)>0
ORDER BY mov_title;

--15

select d.dir_fname , d.dir_lname , m.mov_title , r.rev_stars
from director d , movie m , movie_direction md 
where m.mov_id = md.mov_id
and r.mov_id = m.mov_id
and d.dir_id = md.dir_id;


--16 


select m.mov_title ,  a.act_fname, a.act_lname , mc.role
from movie m , actor a, movie_cast mc
where m.mov_id = mc.mov_id
and a.act_id = mc.act_id
and a.act_id in (select act_id from movie_cast  
                group by act_id 
                 having count(*)>=2
                );

--17

select d.dir_fname , d.dir_lname , m.mov_title , a.act_fname,a.act_lname,mc.role
from director d , movie m , movie_direction md , movie_cast mc , actor a
where d.dir_id = md.dir_id
and m.mov_id = md.mov_id
and mc.mov_id = m.mov_id
and mc.act_id = a.act_id
and a.act_fname like '%Claire%'
and a.act_lname like '%Danes%';

--18 #Write a query in SQL to find the first and last name of an actor with their role in 
--the movie which was also directed by themselve.

select m.mov_title , a.act_fname,a.act_lname , mc.role
from movie m , actor a , movie_direction md , director d , movie_cast mc
where m.mov_id = md.mov_id
and a.act_id = mc.act_id
and mc.mov_id = m.mov_id
and md.dir_id = d.dir_id
and a.act_fname =d.dir_fname
and a.act_lname =d.dir_lname;

--19 Write a query in SQL to find the cast list for the movie Chinatown.

select a.act_fname , a.act_lname 
from actor a , movie_cast mc , movie m
where mc.act_id = a.act_id
and mc.mov_id = m.mov_id
and m.mov_title='Chinatown';

--20.Write a query in SQL to find the movie in which the actor appeared whose first and last name are 'Harrison' and 'Ford'

select m.mov_title
from movie m , actor a , movie_cast mc
where m.mov_id = mc.mov_id
and a.act_id = mc.act_id
and a.act_fname ='Harrison'
and a.act_lname='Ford'

--21

select m.mov_title , m.mov_year , m.mov_rel_country , max(r.rev_stars)
from movie m , rating r 
where m.mov_id =r.mov_id
group by m.mov_title , m.mov_year , m.mov_rel_country;

--22

SELECT mov_title, mov_year, rev_stars
FROM movie 
NATURAL JOIN movie_genres 
NATURAL JOIN genres 
NATURAL JOIN rating
WHERE gen_title = 'Mystery' AND rev_stars >= ALL (
SELECT rev_stars
FROM rating 
NATURAL JOIN movie_genres 
NATURAL JOIN genres
WHERE gen_title = 'Mystery');


--23

SELECT mov_year,gen_title,count(gen_title), avg(rev_stars)
FROM movie 
NATURAL JOIN movie_genres 
NATURAL JOIN genres
NATURAL JOIN rating
WHERE gen_title='Mystery' 
GROUP BY mov_year,gen_title;


--24

SELECT mov_title, act_fname, act_lname, 
mov_year, role, gen_title, dir_fname, dir_lname, 
mov_dt_rel, rev_stars
FROM movie 
NATURAL JOIN movie_cast
NATURAL JOIN actor
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director
NATURAL JOIN rating
WHERE act_gender='F';
