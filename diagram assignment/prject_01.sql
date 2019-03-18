




	



		Create Table  Department(

	
    dept_name  varchar(10) primary key ,
	budget numeric(12,2),
	Building varchar(10)
	)

	Create Table Course
(
	CourseID varchar(10) primary key,
    title varchar(10)  not null,
	dept_name varchar(10) foreign key references Department(dept_name) ,
	credits numeric(2,0) )

			Create Table  prereq
(
	
	CourseID varchar(10) foreign key references   Course(CourseID) not null,
	prereq_id int)

		Create Table  instructor
(
	ID varchar(10) primary key,
    name varchar(10)  not null,
	dept_name varchar(10) foreign key references Department(dept_name)  null,
	salary numeric(8,2))

	Create Table  Section
(
	CourseID varchar(10),
    Semester varchar(10)  not null,
	SecID varchar(10),
	room_no varchar(10) ,
	totalcredit int  ,
	year numeric(4,0),
	building varchar(10),
	time_slot_id varchar(10)
	primary key(courseID,secId,semester,year),
	foreign key(courseId) references Course
	)

				Create Table Teaches
(
	ID varchar(10) ,
    CourseID varchar(10),
	SecID varchar(10),
	semester varchar(10)  ,
	year numeric(4,0)
	primary key(ID,CourseID,SecID,semester,year),
	foreign key(CourseID,SecID,semester,year) references section,
	foreign key (ID) references instructor


	)

		Create Table Student
(
	ID varchar(10),
    name  varchar(10) primary key not null,
	dept_name varchar(10),
	totalcredit numeric(3,0)
	
	        foreign key (ID) references instructor,       
			 foreign key (dept_name) references department) 

	
	Create Table  Time_slot
(
	CourseID varchar(10) foreign key references   Course(CourseID) not null,
	Time_slot_id int  null,
	day int,
	start_time int,
	end_time int
	)




	Create Table  Advisor
(
s_id int,
i_id int
)
	



		Create Table  Classroom
(
	Building  varchar(10) primary key not null,
    room_no varchar(10)  not null,

	capacity int)



			Create Table Takes
(


ID varchar(10),
        course_id varchar(10),
sec_id varchar(10),
semester varchar(10),
 year numeric(4,0),
 grade varchar(5),
 primary key ( ID,course_id, sec_id, semester, year),       
  foreign key (ID) references  instructor,       
   foreign key (course_id, sec_id, semester, year) references section )

	

