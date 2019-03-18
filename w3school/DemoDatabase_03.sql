Create Table Customers
(
	CustomerID int primary key  not null,
    CustomerName varchar(50) not null,
	ContactName varchar(50) null,
	Address varchar(50) null,
	City varchar(50) null,
	PostalCode varchar(50) not null,
	Country char(50)

)

insert into Customers(CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country)
values(1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin',12209,'germany'),
(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.',05021,'Mexico'),
(3,'Antonio Moreno Taquería','	Antonio Moreno','Mataderos 2312','México D.F.',05023,'Mexico'),
(4,'Around the Horn','	Thomas Hardy','120 Hanover Sq.','London', 09887,'UK'),
(5,'Berglunds snabbköp','	Christina Berglund','Berguvsvägen 8','Luleå',95822,'Swden')



Create Table Orders
(
	CustomerID int  foreign key references Customers(CustomerID),
    OrderID int primary key not null,
	EmployeeID  int null,
	OrderDate Datetime,
	ShipperID int not null

)

insert into Orders(CustomerID,OrderID,EmployeeID,OrderDate,ShipperID)
values(1,10353,8,GETDATE(),3),
(2,10354,6,1996-11-14,1),
(3,10355,4,1996-11-18,2),
(4,10356,6,GETDATE(),5)


--1.The following SQL statement creates two aliases, one for the CustomerID column and one for the CustomerName column:
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;

--2.The following SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):

SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;

--3.inner join
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


--4.
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--5.left join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
--6.
SELECT Customers.CustomerName, Orders.OrderID,Customers.City,Orders.ShipperID
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

