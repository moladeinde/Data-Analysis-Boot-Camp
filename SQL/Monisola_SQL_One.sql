/*--==========================================================
Name: MONISOLA OLADEINDE


Please run your query against the AdventureWorks2014 or AdventureWorks2014 database, 
and please ensure that your query run and able to return record.
--============================================================*/
USE AdventureWorks2016
GO

/*Question 1 
Please return all the records in the [Person].[Person] table
*/
SELECT *
FROM Person.Person 

/* Question 2 
Using your answer from question 1, please return the first name, last name
and middle name from the person.person
*/
SELECT
     FirstName,
	 LastName,
	 MiddleName
FROM Person.Person  

/*Question 3 
Return all the records from the [Person].[CountryRegion] where
the name is Australia and order your result by CountryRegionCode 
in a descending order
*/
SELECT *
FROM Person.CountryRegion
WHERE NAME = 'Australia'
ORDER BY CountryRegionCode DESC 

/* Question 4 
 As a data analyst you have been task by your 
 manager to return the currencycode and name from 
 the [Sales].[Currency] table. It is important that 
 as part of the request that you return only the name
 names that is Naira
*/
 SELECT
       Currencycode,
	   Name
FROM Sales.Currency
WHERE Name = 'Naira'

/* Question 5 
Please return all the records from the person.address table
*/
SELECT *
FROM person.Address   

/* Question 6 
Using your code from question 5, please return only the city, postal code,
and the address ID
*/
SELECT 
     City,
	 PostalCode,
	 AddressID
FROM person.Address

/* Question 7 
It is the holiday season and your manager wants you to write a code
that will return all the records from the humanresource.employees table.
*/
SELECT *
FROM HumanResources.Employee

/* Question 8 
Using the answer you got from question 7, your manager now wants your to
only display the jobtitle, the birthdate, the vacation hours
and their sick leave hours of the employees.
*/
SELECT 
     JobTitle,
	 BirthDate,
	 VacationHours,
	 SickLeaveHours
FROM HumanResources.Employee

 /*Question 9 
Return the JobTitle ,BirthDate ,MaritalStatus, Gender from the
humanresource.employees table that are married and gender is female 
*/
SELECT
      Jobtitle,
	  BirthDate,
	  Maritalstatus,
	  Gender
FROM HumanResources.Employee 
WHERE MaritalStatus = 'M' AND Gender = 'F'

/*Question 10 
You have been task to write a query that will return the 
SalesOrderID,SalesOrderNumber,PurchaseOrderNumber
,CustomerID,SalesPersonID,SubTotal,TaxAmt,TotalDue
from the sales.SalesOrderHeader table for those that have
total due grater than 500
*/
SELECT
      SalesorderID,
	  SalesOrderNumber,
	  PurchaseOrderNumber,
	  CustomerID,
	  SalespersonID,
	  Subtotal,
	  TaxAmt,
	  TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue > 500

/* Question 11 
You work for a manufacturing company and the directors are about
to make a decision on designing of a new product, 
they will like you to check in the production.product table to see if the 
product names listed below exists in the database
	Chainring Nut
	Chain Stays
	Touring End Caps
	Flat Washer 1
*/
SELECT *
FROM [Production].[Product]
WHERE Name IN ('Chainring Nut','Chain stays','Touring End Caps','Flat Washer 1')

/*Question 12 
The festive period is here and your company will like you to 
keep track of the inventory of the company. Your manager wants
 you to generate a dataset that will display the product ID, 
 shelf and quantity from the product.productinventory table. 
*/
SELECT
      [ProductID],
	  Shelf,
	  Quantity
FROM [Production].[ProductInventory]