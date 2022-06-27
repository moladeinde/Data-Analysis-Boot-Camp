/*
YOUR NAME:MONISOLA OLADEINDE

Description: Please run your queries against the Adventureworks database
			 Please ensure that your query runs and you validated the result
*/
USE AdventureWorks2016
GO

/*QUESTION 1  
Please return the [ProductID] ,[Name] ,[MakeFlag] ,[Color] ,
[SafetyStockLevel]
 ,[ReorderPoint] ,[StandardCost],[ListPrice],[Size] 
 from the [Production].[Product]
 only return records that have product name ending in Race
*/

SELECT 
     ProductID,
	 Name,
	 MakeFlag,
	 Color,
	 SafetyStockLevel,
	 ReorderPoint,
	 StandardCost,
	 ListPrice,
	 Size
FROM Production.Product
WHERE Name LIKE '%Race'
GO

/*QUESTION 2 
Using you answer from question 1, please return only the record
that have days to manufacture as 0. Please remember that question two
is adding to the result from question 1
*/

SELECT 
     ProductID,
	 Name,
	 MakeFlag,
	 Color,
	 SafetyStockLevel,
	 ReorderPoint,
	 StandardCost,
	 ListPrice,
	 Size,
	 DaysToManufacture
FROM Production.Product
WHERE Name LIKE '%Race' AND DaysToManufacture = 0
GO

/*QUESTION 3 
Please return the [SalesOrderID],[SalesOrderNumber],[PurchaseOrderNumber]
,[CustomerID],[SalesPersonID],[SubTotal],[TaxAmt],[TotalDue]
from the [Sales].[SalesOrderHeader] but only return records 
that have total due grater that 500 but tax amount less than 100.
Please validate your results.
*/
SELECT 
      SalesOrderID,
	  SalesOrderNumber,
	  PurchaseOrderNumber,
	  CustomerID,
	  SalesPersonID,
	  SubTotal,
	  TaxAmt,
	  TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue > 500 AND TaxAmt < 100
GO

/*QUESTION 4
Return the job title, birthdate, gender, and vacation hours
with job title containing the word 'sign' 
Tables involved: humanresources.employee
*/

SELECT
     JobTitle,
	 Birthdate,
	 Gender,
	 VacationHours
FROM HumanResources.Employee
WHERE JobTitle LIKE '%sign%'
GO
/*QUESTION 5 
Retrun the Marital status, sick leave hours and the nationalID number
but limit your result to only return records that have sick leave
only the minimum sick leave hours grater than 50 and vacation hours less 
than 80
Tables involved: humanresources.employee
*/
SELECT 
      MaritalStatus,
	  SickLeaveHours,
	  NationalIDNumber,
	  VacationHours
FROM HumanResources.Employee
WHERE SickLeaveHours > 50 AND VacationHours < 80
GO

/*QUESTION 6
Due to so many compaint from customers, your manager wants
you to generate datasets that will displ	he scrap reason and Modified date
from the Production.ScrapReason table that contain the word failed. 
this will help them respond to the customers accordingly
*/
SELECT
     ScrapReasonID,
	 ModifiedDate
FROM Production.ScrapReason
WHERE Name LIKE '%failed%'
GO

/*QUESTION 7 
Write a SQL query to return the product Description ID and product 
description from the Production.ProductDescription, but only
return records that have discription starting with the word "Aluminum"
Please validate your result
*/
SELECT
      ProductDescriptionID,
	  Description
FROM Production.ProductDescription
WHERE Description LIKE 'Aluminum%'
GO

/*QUESTION 8 
Please write a SQL query that will display the title, file name, 
document summary and documet from the Production.Document, but limit 
your result to only return 
records that have the file name ending in ".doc" the sort your result
by the title in ascending  order
*/
SELECT
      Title,
	  FileName,
	  DocumentSummary,
	  Document
FROM Production.Document
WHERE Filename LIKE '%.doc%'
ORDER BY Title ASC
GO

 /* QUESTION 9 
Your manager will like you to generate datasets that
will display the name, account number and credit rating
from the Purchasing.Vendor. Please sort your record using the name in
descending order
*/
SELECT
     Name,
	 AccountNumber,
	 CreditRating
FROM Purchasing.Vendor
ORDER BY Name DESC
GO

/* QUESTION 10 
Your manager forgot to add to the requirement in question 9, but have asked
you to only return records whose credit rating is above 2.
Please remember that question 10 is just adding to your result from 9.
*/
SELECT
     Name,
	 AccountNumber,
	 CreditRating
FROM Purchasing.Vendor
WHERE CreditRating > 2
ORDER BY Name DESC
GO
     
/* QUESTION 11 
Please write a SQL query that will product ID,  Standard price, MinOrderQty
from the Purchasing.ProductVendor, but limit your result to return
records that Standard price between 20 and 35.
*/
SELECT
     ProductID,
	 StandardPrice,
	 MinOrderQty
FROM Purchasing.ProductVendor
WHERE StandardPrice BETWEEN 20 AND 35
ORDER BY StandardPrice ASC
GO

/* QUESTION 12 
Write a query to generate dataset that will display the 
Category,StartDate,EndDate,MinQty,MaxQty from the Sales.SpecialOffer table
that have category as reseller and the minimum quantity
are grater than 0 
*/
SELECT 
      Category,
	  StartDate,
	  EndDate,
	  MinQty,
	  MaxQty
FROM Sales.SpecialOffer
WHERE Category = 'Reseller' AND MinQty > 0
GO

/*QUESTION 13 
You work for a manufacturing company and the directors are about
to make a decision on designing of a new product, 
they will like you to return the Name as ProductName, color as ProductColor,
list price as ProductPrice from the production.Product. Sort your result by 
the name in a descending order.

*/
SELECT
     Name AS ProductName,
	 Color AS ProductColor,
	 ListPrice AS ProductPrice
FROM Production.Product
ORDER BY Name DESC
GO

/* QUESTION 14 
You work as a senior data analyst and you are called to look at the below
query written by a junior analyst. Can you tell why the query is wrong
and provide a fix please.
*/

select ProductID
from production.TransactionHistory
ORDER BY ProductID DESC
GROUP BY ProductID
GO
-- It did not run because the query did not follow the logical process.

SELECT ProductID
FROM production.TransactionHistory
GROUP BY ProductID
ORDER BY ProductID DESC
GO

/* QUESTION 15 
Extract the CreditCardID, CardNumber, CardType, ExpMonth, ExpYear
from the Sales.CreditCard. Sort your result to display 
in an Alphabatical order of the card type.
*/
SELECT
     CreditCardID,
	 CardNumber,
	 CardType,
	 ExpMonth,
	 ExpYear
FROM Sales.CreditCard
ORDER BY CardType ASC
GO

/*QUESTION 16 
Using your answer from question 15, please only display records that 
the CardType is NOT Vista
*/
SELECT
     CreditCardID,
	 CardNumber,
	 CardType,
	 ExpMonth,
	 ExpYear
FROM Sales.CreditCard
WHERE CardType != 'Vista'
ORDER BY CardType ASC
GO

/* QUESTION 17 
Write a query to return the Rate, PayFrequency, BusinessEntityID
FROM the HumanResources.EmployeePayHistory table, but display only records
that have grater than 10 or PayFrequency and BusinessEntityID is between 50 and 150
*/
SELECT 
      Rate,
	  PayFrequency,
	  BusinessEntityID
 FROM HumanResources.EmployeePayHistory
 WHERE Rate > 10 OR PayFrequency BETWEEN 50 AND 150 AND BusinessEntityID BETWEEN 50 AND 150
 GO
 
/*QUESTION 18 
Write a SQL code that will return the TerritoryID, Bonus, 
CommissionPct, SalesYTD and SalesLastYear from the Sales.SalesPerson. 
Sort your record by Territory ID  in Ascending order.
*/
SELECT
     TerritoryID,
	 Bonus,
	 CommissionPct,
	 SalesYTD,
	 SalesLastYear
FROM Sales.SalesPerson
ORDER BY TerritoryID ASC
GO

/*QUESTION 19 
Using your result from question 18, please return only the records that
have the SalesYTD less than the SalesLastYear.
Please remember that question 19 is to add to the result from question 18
*/
SELECT
     TerritoryID,
	 Bonus,
	 CommissionPct,
	 SalesYTD,
	 SalesLastYear
FROM Sales.SalesPerson
WHERE SalesYTD < SalesLastYear
ORDER BY TerritoryID ASC
GO

/*QUESTION 20
In your own words, please provide the meaning of the below questions.
What is a Primary Key? give example
It is an attribute used to uniquely identify each record in a table. 
We can only have one primary key in a table, and it does not accept NULL or duplicates. Examples are SSN, OrderID

What is a Foreign key? give example.
It is an attribute that is used to reference a relationship between two tables.
It accepts NULL and duplicates.

What is a schema? 
It defines how data is organized within a relational database. It contains tables that store information required.

What is the difference between an attribute and a column
A column is a column in a database table, while an attribute is an externally visible facet of an object.
An attribute is for a model, while a column  is for a table in a database.
Attribute is a piece of information that describes an entity. It characterizes an entity, while a column  contains the
the characteristics that describes it.

*/

/*QUESTION 21
Using answer from question 11 create a derived column VacationCheck
 that meets the condition below:
If Marital status is M AND Vacation hours grater than 40 and sick 
leave hours grater than 60 then return "Approved" 
else every other thing should say considered.
*/
--Question 11 does not relate to question 21.

/*QUESTION 22
The monthly report for your company is due, and your manager wants
you to write a query against the [Sales].[Customer] that
returns count of the StoreID's that are less than 2.
*/
SELECT 
    StoreID,
	COUNT(*)
FROM Sales.Customer
GROUP BY StoreID 
HAVING COUNT(*) < 2
GO

/*QUESTION 23 
Calculate total sum of [UnitPrice] against the UnitPrice
from the Sales.SalesOrderDetail
*/
SELECT 
      SUM(UnitPrice), UnitPrice
FROM Sales.SalesOrderDetail
GROUP BY UnitPrice
GO

/*QUESTION 24
Write a SQL query that will generate datasets that 
display the first name, last name, and a 
derived column called FirstThree that will show the first three characters of 
the first name from the person.Person table.
*/
SELECT
     FirstName,
	 LastName,
	 SUBSTRING(FirstName,1,3) AS FirstThree
FROM Person.Person
GO

/* QUESTION 25
Write a SQL query that will generate datasets that display's the 
[JobTitle],[BirthDate],[HireDate].
Write derived columns
Write derived column name statusCheck to display the following
	If the marital status is "S" the return "single"
	if the marital status is "M", then return "Married" 
	from the humanresource.Employee
*/
SELECT
      JobTitle,
	  BirthDate,
	  HireDate,
	  MaritalStatus,
	  CASE
	  WHEN MaritalStatus = 'S' THEN 'Single'
	  WHEN MaritalStatus = 'M' THEN 'Married'
	  END AS StatusCheck
FROM HumanResources.Employee
GO

/*QUESTION 26 
Write a SQL query that will display the first name and last name from the 
Person.Person table
*/
SELECT 
      FirstName,
	  LastName
FROM Person.Person
GO

/*QUESTION 27 
Using the answer from question 26, 
add a derived column called full name. this derived column
 should hold the combination of the last name and first name
*/
SELECT 
      FirstName,
	  LastName,
	  CONCAT(FirstName,' ', LastName) AS FullName   
FROM Person.Person
GO

/*QUESTION 28 
Using your result from question 23, your manager will like you to have a 
delimiter on the full name the delimiter should be a dash so meaning every full name should 
have a dash (-) in between the last name and first name
*/
SELECT 
      FirstName,
	  LastName,
	  CONCAT(FirstName,'-', LastName) AS FullName   
FROM Person.Person
GO

/*QUESTION 29
Write a query against SalesOrderHeader to generate a dataset that will return
the three-ship countries with the highest average freight 
*/
SELECT
     AVG(Freight)
FROM Sales.SalesOrderHeader
GROUP BY Freight
ORDER BY Freight DESC
OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY
GO

/*QUESTION 30 
Your company is about to send information to employees who may be losing their vacation hours due
to the end-of-year cut of vacation hours. You have been a task to generate a dataset against 
the employee's table to display the job title, marital status, gender, vacation hours, and sick leave.
*/
SELECT 
     JobTitle,
	 MaritalStatus,
	 Gender,
	 VacationHours,
	 SickLeaveHours
FROM HumanResources.Employee
GO

/*QUESTION 31 
Using your dataset from Question 25, the business will like you to add a derived column called 
VacHoursCheck this column should have the below information
	1. If the vacation hours is greater than 70, display "Send Email"
	2. If the vacation hours are less than or equal to 70, display "Safe"
*/
SELECT
      JobTitle,
	  BirthDate,
	  HireDate,
	  MaritalStatus,
	  VacationHours,
	  CASE
	  WHEN MaritalStatus = 'S' THEN 'Single'
	  WHEN MaritalStatus = 'M' THEN 'Married'
	  END AS StatusCheck,
	  CASE
	  WHEN VacationHours > 70 THEN 'Send EMail'
	  WHEN VacationHours <= 70 THEN 'Safe'
	  END AS VacHoursCheck
FROM HumanResources.Employee
GO




