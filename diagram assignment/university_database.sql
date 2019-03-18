




	
		Create Table  prereq
(
	
	CourseID int foreign key references   Course(CourseID) not null,
	prereq_id int)

		Create Table  Department
(
	
    dept_name  varchar(50) primary key not null,
	Building varchar(50),
	budget varchar(50))

	Create Table Course
(
	CourseID int primary key  not null,
    title varchar(50)  not null,
	dept_name varchar(50) foreign key references Department(dept_name) null,
	credits int  null,)


	
	Create Table  Time_slot
(
	CourseID int foreign key references   Course(CourseID) not null,
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
	Building  varchar(50) primary key not null,
    room_no varchar(50)  not null,

	capacity int)




	Create Table  instructor
(
	ID int foreign key references   Teaches(ID) not null,
    name varchar(50)  not null,
	dept_name varchar(50) foreign key references Department(dept_name)  null,
	salary int)

	Create Table Student
(
	
    name  varchar(50) primary key not null,
	ID int foreign key references   Teaches(ID) not null,
	dept_name varchar(50) foreign key references Department(dept_name) null,
	totalcredit int  null,
	

)



Create Table  Section
(
	CourseID int foreign key references   Course(CourseID) not null,
    Semester varchar(50)  not null,
	SecID int foreign key references Takes(SecID)  null,
	room_no varchar(50) null,
	totalcredit int  null,
	year int,
	building int,
	time_slot_id int)




			Create Table Teaches
(
	ID int primary key not null,
    CourseID int foreign key references   Course(CourseID) not null,
	semester varchar(50)  null,
	
	year int)

			Create Table Takes
(
	ID int foreign key references   Teaches(ID) not null,
    CourseID int foreign key references   Course(CourseID) not null,
	SecID int primary key not null,
	Year int null,
	Grade varchar(50) not null,
	

)