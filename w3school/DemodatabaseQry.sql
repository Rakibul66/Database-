--first table
Create Table Customers
(
	CustomerID int  not null,
    CustomerName varchar(50) primary key not null,
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

--second table
Create Table Product
(
	ProductID int  not null,
    ProductName varchar(50)  not null,
	SupplierID int  null,
	CategoryID int  null,
	Unit varchar(30) null,
	
	price int

)
insert into Product(ProductID,ProductName,SupplierID,CategoryID,unit,price)
values(1,'chais21',1,1,'boxs',18),
(2,'change12',1,1,'bottle',19),
(3,'potato',1,2,'laptop',5),
(4,'burger',2,2,'bikes',17),
(5,'pen',2,2,'36 boxs',14)


--1.The following SQL statement selects only the DISTINCT values from the "Country" column in the "Customers" table:

SELECT DISTINCT Country FROM Customers;

--2.The following SQL statement lists the number of different (distinct) customer countries:
SELECT COUNT(DISTINCT Country) FROM Customers;

--3.The following SQL statement selects the "CustomerName" and "City" columns from the "Customers" table:
SELECT CustomerName, City FROM Customers;

--4.The following SQL statement selects all the customers from the country "Mexico", in the "Customers" table:
SELECT * FROM Customers
WHERE Country='Mexico';

--5.The following SQL statement selects all fields from "Customers" where country is "Germany" AND city is "Berlin":
 
SELECT * FROM Customers
WHERE Country='germany' AND City='Berlin';

--6.The following SQL statement selects all fields from "Customers" where city is "Berlin" OR "München":
SELECT * FROM Customers
WHERE City='Berlin' OR City='Luleå';

--7.following SQL statement selects all fields from "Customers" where country is NOT "Germany":
SELECT * FROM Customers
WHERE NOT Country='Germany';

--8.
SELECT * FROM Customers
WHERE Country='Mexico' AND (City='México D.F.' OR City='México D.F.');

--9.The following SQL statement selects all fields from "Customers" where country is NOT "Germany" and NOT "Swden":

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='Swden';

--10.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 12209.

 use  DemoDatabase_01
  go
 select* FROM Customers where

 City = 'Berlin' and PostalCode = 12209;

  --11.The following SQL statement selects all customers from the "Customers" table, sorted by the "Country" column:
  SELECT * FROM Customers
ORDER BY Country  ;

--12.The following SQL statement selects all customers from the "Customers" table, sorted DESCENDING by the "Country"

 SELECT * FROM Customers
ORDER BY Country DESC;

--13

SELECT * FROM Customers
ORDER BY Country, CustomerName;
--14
SELECT * FROM Customers
  ORDER BY  CustomerName DESC , Country ASC ;

--15
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'London'
WHERE CustomerID = 4;

--16

SELECT TOP 3 * FROM Customers;

--17.The following SQL statement shows the top 50%
SELECT TOP 50 PERCENT * FROM Customers;

--18.The following SQL statement selects the first three records from the "Customers" table, where the country is "Germany":

SELECT TOP 3 * FROM Customers
WHERE Country='Germany';

--19.The following SQL statement selects all customers with a CustomerName starting with "a":
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

--20.The following SQL statement selects all customers with a CustomerName ending with "a":

SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

--21.The following SQL statement selects all customers with a CustomerName that have "r" in the second position:
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

--22.The following SQL statement selects all customers with a CustomerName that have "or" in any position:
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

--23.The following SQL statement selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a_%_%';

--24.The following SQL statement selects all customers with a ContactName that starts with "a" and ends with "o":

SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

--25.The following SQL statement selects all customers with a CustomerName that does NOT start with "a":

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';

--26.The following SQL statement selects all customers with a City containing the pattern "xi": 
SELECT * FROM Customers
WHERE City LIKE '%xi%';
--27.
SELECT * FROM Customers
WHERE City LIKE 'ber%';

--28.The following SQL statement selects all customers with a City starting with any character, followed by "erlin":

SELECT * FROM Customers
WHERE City LIKE '_erlin';
--29.
SELECT * FROM Customers
WHERE City LIKE 'L_n_on';
 
--30.The following SQL statement selects all customers that are located in "Germany", "swden" and "UK":
SELECT * FROM Customers
WHERE Country IN ('Germany', 'swden', 'UK');

--31.
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'UK');


-- table 2 query
--1.The following SQL statement finds the price of the cheapest product and max:

SELECT MIN(price) AS SmallestPrice
FROM Product;

SELECT MAX(price) AS LargestPrice
FROM Product;

--2.update
UPDATE product
SET price=5
WHERE ProductID=5;

--3.count
SELECT COUNT(ProductID)
FROM Product;
--4.average
SELECT AVG(Price)
FROM Product;

--5.sum
SELECT SUM(price)
FROM Product;
--6.
SELECT * FROM Product
WHERE Price BETWEEN 10 AND 20;
--7.
SELECT * FROM Product
WHERE Price  NOT BETWEEN 10 AND 20;
--8.
SELECT * FROM Product
WHERE (Price BETWEEN 10 AND 20)
AND NOT CategoryID IN (1,2,3);
--9.
SELECT * FROM Product
WHERE ProductName BETWEEN 'potato' AND 'pen'
ORDER BY ProductName;
