
		Create Table  tbEmployee(

	ID int primary key not null,
    Employee_name  varchar(10) ,
	Email varchar(12) unique,
	DesinationId varchar(10),
	FatherName varchar(10),
	MotherName varchar(10),
	NationalID varchar(10)
	)

	Create Table Tb_EmployeeUserType(

	EmployeeID varchar(10) primary key,
    UserTypeID varchar(10),
	ID int foreign key references tbEmployee(ID) ,

	)

			Create Table  tb_Leavetype
(
	
ID int foreign key references   tbEmployee(ID) not null,
	LeaveTypeName varchar(10) primary key
	
	)

		Create Table  tb_Designation
(
	DesignationName varchar(10) primary key,
	ID  int foreign key references tbEmployee(ID)   not null,
	)

	

	create table tb_UserType(
	UserTypeName varchar(10) primary key,
	EmployeeID varchar(10) foreign key references tb_EmployeeUsertype(EmployeeID))

	create table tbEmployeeleave (
	startdate datetime,
	enddate datetime,
	entrydate datetime,
	totalday int ,
	status varchar(10),
	leaveTypeID int primary key)

	create table tbEmployeepassword(
	password varchar(10) primary key,
	ID  int foreign key references tbEmployee(ID)   ,
	
	EmployeeID varchar(10)  foreign key references tb_EmployeeUsertype(EmployeeID))

	create table tb_allocationLeave(
	ID  int foreign key references tbEmployee(ID)   ,
	EmployeeID varchar(10)  foreign key references tb_EmployeeUsertype(EmployeeID),
	leavetypeID int foreign key references tbEmployeeleave(leaveTypeID ),
	NumberofLeave varchar(10))

