/*
YOUR NAME: MONISOLA OLADEINDE

Description: Please run your queries against the Adventureworks database
			 Please ensure that your query runs and you validated the result
*/

USE AdventureWorks2016
GO

/*QUESTION 1  
Write a query to return the customer ID from Sales.SalesOrderHeader table
*/
SELECT 
       CustomerID  
FROM   Sales.SalesOrderHeader

/*QUESTION 2 
Using your response from question 1, add a derived column called
CustCount that will count the occurrence of the customer ID
*/
SELECT   COUNT (*) 'CustCount',
         CustomerID  
FROM     Sales.SalesOrderHeader
GROUP BY CustomerID

/*QUESTION 3
Using your answer from question 2, only return the customer ID
that appears more than once.
*/
SELECT   COUNT (*) 'CustCount', 
         CustomerID  
FROM     Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING   COUNT(*) > 1

/*QUESTION 4 
Write a query to retrieve the highest tax amount from the Sales.SalesOrderHeader 
table.
*/
SELECT MAX (TaxAmt) --17948.5186
FROM   Sales.SalesOrderHeader

/*QUESTION 5 
Write a query that will return the latest ship date from the
Sales.SalesOrderHeader table.
*/
SELECT  MAX (ShipDate)    --2014-07-07 00:00:00.000
FROM    Sales.SalesOrderHeader 

/*QUESTION 6 
Using your answer from question 5, add the customer ID that
have those ship date.
*/
SELECT  
      MAX (ShipDate),    
	  CustomerID
FROM  Sales.SalesOrderHeader
WHERE ShipDate = '2014-07-07 00:00:00.000'
GROUP BY CustomerID, SHipDate

/*QUESTION 7 
Write a query that will extract the first two characters from the 
Purchase Order Number on the Sales.SalesOrderHeader table.
Example for a Purchase Order Number or PO18386167654 return PO.
*/
SELECT
      PurchaseOrderNumber,
      SUBSTRING(PurchaseOrderNumber,1,2)
FROM  Sales.SalesOrderHeader

/*QUESTION 8 
Write a query that will display the order Date, Due date, ship data, 
online order flag, account number, customer ID, and tax amount from the 
Sales.SalesOrderHeader table.
*/
SELECT
       OrderDate,
       DueDate,
	   ShipDate,
	   OnlineOrderFlag,
	   AccountNumber,
	   CustomerID,
	   TaxAmt   
FROM   Sales.SalesOrderHeader

/*QUESTION 9 
Due to confusion on the way the online order flag was reported,
you have been asked to modify the result from question 8.
Add a derived column called OrderStatus, and this column should
contain the following information.
If the online order flag is 0, display "In-Store," and if the 
online order flag is 1 display "Online."
*/
SELECT
     CASE 
	 WHEN OnlineOrderFLag = '0' THEN 'In-Store'
	 WHEN OnlineOrderFlag = '1' THEN 'Online'
	 END AS OrderStatus
FROM Sales.SalesOrderHeader

/*QUESTION 10 
Return the maximum Line total from the 
[Sales].[SalesOrderDetail]
*/
SELECT MAX (LineTotal)   --- 27893.619000
FROM   Sales.SalesOrderDetail

/*QUESTION 11  
Return the job title, birthdate, gender, and vacation hours, sick leave hours.
Add a derived column called FlagCheck that meets the below condition
If the salaried Flag is 1, then Employee else contractor.
*/
SELECT 
      CASE
	  WHEN SalariedFlag = 1 THEN 'Employee'
	  ELSE 'Contractor'
	  END AS FlagCheck,
	  SalariedFlag,
	  JobTitle,
	  Birthdate,
	  Gender,
	  VacationHours,
	  SickLeaveHours   
FROM  HumanResources.Employee

/*QUESTION 12 
Using answer from question 11 create a derived column VacationCheck
 that meets the condition below:
If Marital status is M AND Vacation hours grater than 40 and sick 
leave hours grater than 60 then return "Approved" 
else every other thing should say considered.
*/
SELECT 
      CASE
	  WHEN MaritalStatus ='M' AND VacationHours > 40 AND SickLeaveHours > 60 THEN 'Approved'
	  ELSE 'Considered'
	  END AS VacationCheck,
	  MaritalStatus,
	  VacationHours,
	  SickLeaveHours,
      CASE
	  WHEN SalariedFlag = 1 THEN 'Employee'
	  ELSE 'Contractor'
	  END AS FlagCheck,
	  SalariedFlag,
	  JobTitle,
	  Birthdate,
	  Gender
FROM  HumanResources.Employee

/*QUESTION 13 
Please return the top 6 currency from the [Sales].[Currency] by their
modified date
*/
SELECT 
      CurrencyCode
FROM  Sales.Currency
ORDER BY ModifiedDate ASC
OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY

/* QUESTION 14 
Return the Category,Star tDate,End Date,minimum quantity,maximum from the
[Sales].[SpecialOffer] where the category is a reseller and the 
minimum quantity is greater than or equal to 0 and maximum quantity is KNOWN
*/
SELECT    
      Category,
      StartDate,
	  EndDate,
	  MinQty,
	  MaxQty
FROM  Sales.SpecialOffer 
WHERE Category = 'Reseller' AND MinQty >= 0 AND MaxQty IS NOT NULL

/*QUESTION 15 
The monthly report for your company is due, and your manager wants
you to write a query against the [Sales].[Customer] that
returns count of the StoreID's that are less than 2.
*/
SELECT COUNT (*) 'NoOfOcc', StoreID
FROM   Sales.Customer
GROUP BY StoreID
HAVING COUNT (*) < 2

/*QUESTION 16  
Calculate total sum of [UnitPrice] against the UnitPrice
from the Sales.SalesOrderDetail
*/
SELECT   SUM(UnitPrice), UnitPrice
FROM     Sales.SalesOrderDetail   --56423747.6147
GROUP BY UnitPrice

/*QUESTION 17 
Return the [FirstName] [MiddleName] and [LastName] from the Person.Person table
but limit your result to only employees whose middle names are UNKNOWN
*/
SELECT 
      FirstName,
	  MiddleName,
	  LastName
FROM  Person.Person  
WHERE MiddleName IS NOT NULL

/*QUESTION 18 
Write a query to return the count of each [SalesOrderID]
from the [Sales].[SalesOrderDetail]
*/
SELECT   COUNT(*) 'NoOfOc', SalesOrderID
FROM     Sales.SalesOrderDetail
GROUP BY SalesOrderID

/*QUESTION 19 
Using your answer question 18, please return
the [SalesOrderID] that is less than 2
*/
SELECT COUNT(*) 'NoOfOc', SalesOrderID
FROM   Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT (*) < 2
  
/*QUESTION 20 
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

/* QUESTION 21 
Write a SQL query that will generate datasets that display's the 
[JobTitle],[BirthDate],[HireDate].
Write derived columns
Write derived column name statusCheck to display the following
	If the marital status is "S" the return "single"
	if the marital status is "M", then return "Married" 
	from the humanresource.Employee
*/
SELECT 
      CASE
	  WHEN MaritalStatus = 'S' THEN 'Single'
	  ELSE 'Married'
	  END AS StatusCheck,
	  JobTitle,
	  BirthDate,
	  HireDate     
FROM HumanResources.Employee

/*QUESTION 22  
Write a SQL query that will display the first name and last name from the 
Person.Person table
*/
SELECT 
      FirstName,
	  LastName  
FROM  Person.Person

/*QUESTION 23 
Using the answer from question 22, 
add a derived column called full name. this derived column
 should hold the combination of the last name and first name
*/
SELECT 
      FirstName,
	  LastName,   
	  CONCAT(FirstName,' ',LastName) AS FullName
FROM  Person.Person

/*QUESTION 24 
Using your result from question 23, your manager will like you to have a 
delimiter on the full name the delimiter should be a dash so meaning every full name should 
have a dash (-) in between the last name and first name
*/
SELECT 
      FirstName,
	  LastName,   
	  CONCAT(FirstName,'-',LastName) AS FullName
FROM  Person.Person

/*QUESTION 25 
Write a query against SalesOrderHeader to generate a dataset that will return
the three-ship countries with the highest average freight 
*/
SELECT
      AVG(Freight)
FROM  Sales.SalesOrderHeader
GROUP BY Freight
ORDER BY Freight DESC
OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY

/*QUESTION 26 
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

/*QUESTION 27 
Using your dataset from Question 26, the business will like you to add a derived column called 
VacHoursCheck this column should have the below information
	1. If the vacation hours is greater than 70, display "Send Email"
	2. If the vacation hours are less than or equal to 70, display "Safe"
*/
SELECT
     CASE
     WHEN VacationHours > 70 THEN 'Send Email'
	 ELSE 'Safe'
     END AS VacHoursCheck,
     JobTitle,
	 MaritalStatus,
	 Gender,
	 VacationHours,
	 SickLeaveHours
FROM HumanResources.Employee

/*QUESTION 28 
Using your dataset from question 27, the business will like you to add another derived column called.
MaxReached?. This column should have the following information.
	1. If the sum of the vacation hours and the sick leave hours is greater than 150, then display "Yes"
	2. If the sum of the vacation hours and the sick leave hours is less than 150 but greater than
		70 return "No"
Anything else should return NULL.  
*/
SELECT
     CASE
	 WHEN SUM (VacationHours + SickLeaveHours) > 150 THEN 'Yes'
	 WHEN SUM (VacationHours + SickLeaveHours) < 150 AND SUM (VacationHours + SickLeaveHours)> 70 THEN 'No'
	 ELSE NULL
	 END AS MaxReached,
     CASE
     WHEN VacationHours > 70 THEN 'Send Email' 
	 ELSE 'Safe'
     END AS VacHoursCheck,
	 JobTitle
	 MaritalStatus,
	 Gender,
	 VacationHours,
	 SickLeaveHours
FROM HumanResources.Employee
GROUP BY VacationHours, SickLeaveHours, JobTitle, MaritalStatus, Gender

/*QUESTION 29 
Write a query against the product table that will display the product name, the product name and color
from the production.product table.
*/
SELECT
     Name AS ProductName,
	 Color AS ProductColor
FROM Production.Product

/*QUESTION 30 
Your manager just reviewed your report on question 14, and he is concerned about the NULL values he saw on the
color column. You have been a task to write a derived column called AddColorInfo. The AddColorInfo column should
replace all the NULL's on the color column to read "unknown" so it will be easy to present to the business.
*/

SELECT
     Name AS ProductName,
	 Color AS ProductColor,
     ISNULL(Color, 'Unknown') AS AddColorInfo
FROM Production.Product

/*QUESTION 31 
Write a query against the SalesOrderDetail that will return duplicate product ID
*/
SELECT COUNT (*) NoOfocc, ProductID
FROM   Sales.SalesOrderDetail
GROUP BY ProductID

/*QUESTION 32 BONUS  
Write a query against the Employee table to display the job title, birth date, and marital status.
Also, add a derived column called FirstWord. This column should hold the first word of the job title.
For example, when the job title is "Chief Executive Officer," we should see "Chief",
when the job title is "Vice President of Engineering," we should see "Vice," and when the
the job title is "Engineering Manager" we should see "Engineering" etc

*/
SELECT 
       JobTitle,
       BirthDate,
       MaritalStatus,
       CHARINDEX(' ',JobTitle) AS POSITION,
       SUBSTRING(JobTitle,1,CHARINDEX(' ',JobTitle)) AS FirstWord,
       CASE
       WHEN CHARINDEX(' ',JobTitle)> 0 THEN SUBSTRING(JobTitle,1,CHARINDEX(' ',JobTitle))
       ELSE JobTitle
END AS FirstWordTrans
FROM   HumanResources.Employee