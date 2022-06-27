/*
YOUR NAME: MONISOLA OLADEINDE

Description: Please run your queries against the Adventureworks database
			 Please ensure that your query runs and you validated the result
*/

USE AdventureWorks2016
GO

/*QUESTION 1
Return the job title, birthdate, gender, and vacation hours
with job title containing the word 'sign' 
Tables involved: humanresources.employee
*/

SELECT
      JobTitle,
	  BirthDate,
	  Gender,
	  VacationHours
FROM HumanResources.Employee
WHERE JobTitle LIKE '%SIGN%'

/*QUESTION 2
Retrun the Marital status, sick leave hours and the nationalID number
but limit your result to only return records that have sick leave
hours grater than 50 and vacation hours less 
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


 /* QUESTION 3
write a SQL statement to return all the account number which name starts with
the word "A" from the Purchasing.Vendor
*/
SELECT
     AccountNumber
FROM Purchasing.Vendor
WHERE AccountNumber LIKE 'A%'

/*QUESTION 4
Write a SQL Statement to display the first name, last name and a derived column called DervName
that will display the first three characters of  the first name.
*/
SELECT 
      FirstName,
	  LastName,
	  SUBSTRING(FirstName,1,3) AS FirstThree
FROM Person.Person


/*QUESTION 5
Write query to retrieve the email address and then add a derived column labeled @Location that return the position 
of the @ sign in the email address column
Table: [Person].[EmailAddress]
HINT: CHARINDEX
SEE SAMPLE OUTPUT BELOW
EmailAddress					@Location
a0@adventure-works.com				3
a1@adventure-works.com				3
aaron0@adventure-works.com			7
aaron1@adventure-works.com			7
...									...
...									...
...									...
aaron10@adventure-works.com			8
aaron11@adventure-works.com			8
aaron12@adventure-works.com			8
 */
 SELECT 
      EmailAddress,
	  CHARINDEX('@',EmailAddress) AS '@Location'
 FROM Person.EmailAddress

 /* QUESTION 6 
Using answer from question 5. Remember that you have to get 5 right 
to get 6 right. 
Write a derived column labeled dotLocation that will find the position of 
the "." in the @Location column
Table: [Person].[EmailAddress]
HINT: CHARINDEX
*/
SELECT 
      EmailAddress,
	  CHARINDEX('@',EmailAddress) AS '@Location',
	  CHARINDEX('.', EmailAddress) AS DotLocation
FROM Person.EmailAddress

 /* QUESTION 7
Write a SQL statement that will display the first name, last and a derived column
called FNspaceRem that will remove the trailing and leading spaces on the First Name
and another derived column LNSpaceRem that will remove all the trailing and leading spaces on the last name
using the [Person].[Person]. 

*/
SELECT 
      FirstName,
	  LastName,
	  LTRIM(RTRIM(FirstName)) AS FNspaceRem,
	  LTRIM(RTRIM(LastName)) AS  LNSpaceRem
FROM Person.Person


 /* QUESTION 8
Using your answer from number 7, please write another derived column called 
FNUPPER that will transform the first name to display all UPPER case

*/
SELECT 
      FirstName,
	  LastName,
	  LTRIM(RTRIM(FirstName)) AS FNspaceRem,
	  LTRIM(RTRIM(LastName)) AS  LNSpaceRem,
	  UPPER(FirstName) AS FNUPPER
FROM Person.Person

 /* QUESTION 9
Using your answer from number 8, please write another derived column called
 LNLOWER that will transform the last name to display all lower case

*/
SELECT 
      FirstName,
	  LastName,
	  LTRIM(RTRIM(FirstName)) AS FNspaceRem,
	  LTRIM(RTRIM(LastName)) AS  LNSpaceRem,
	  UPPER(FirstName) AS FNUPPER,
	  LOWER(LastName) AS LNLOWER
FROM Person.Person

/*QUESTION 10
Write a query to retrieve the birth date from the employee's table.

*/
SELECT 
      BirthDate
FROM HumanResources.Employee

/*QUESTION 11
Using your answer from question 10, add a derived column called BithMonth
that will extract the MONTH of the birth date of each employee.
*/
SELECT 
      BirthDate,
	  DATENAME(MONTH, BirthDate) AS BithMonth
FROM HumanResources.Employee

/*QUESTION 12
Using your answer from question 11, add a derived column called BithYear
that will extract the YEAR of the birth date of each employee.
*/
SELECT 
      BirthDate,
	  DATENAME(MONTH, BirthDate) AS BirthMonth,
	  DATENAME(YEAR, BirthDate) AS BithYear
FROM HumanResources.Employee

/*QUESTION 13
Using your answer from question 12, add a derived column called BithDay
that will extract the DAY of the birth date of each employee.
*/
SELECT 
      BirthDate,
	  DATENAME(MONTH, BirthDate) AS BirthMonth,
	  DATENAME(YEAR, BirthDate) AS BirthYear,
	  DATENAME(DAY, BirthDate) AS BithDay
FROM HumanResources.Employee

/*QUESTION 14
Your company is in the process of rewarding it's customers and they have asked you to generate
a query that will return the order date, due date and ship date and the SalesOrderHeader tables.
Due to the employment situation the company have decided to do a forgiving program.
They want you to add a column called ExtendedDueDate. This date column should 
extend the day of the due date to 30 days.
*/
SELECT
      OrderDate,
	  DueDate,
	  ShipDate,
	  DATEADD(DAY,30,DueDate) ExtendedDueDate
FROM Sales.SalesOrderHeader

/*QUESTION 15
Your data set from question 14 is good but there have been a little confusion
and your manager will like you to add a derived called ExtendShipDt this column
should add 2 months to the ship date

*/
SELECT
      OrderDate,
	  DueDate,
	  ShipDate,
	  DATEADD(DAY,30,DueDate)   ExtendedDueDate,
	  DATEADD(MONTH,2,ShipDate) ExtendShipDt
FROM Sales.SalesOrderHeader

/*QUESTION 16
Using your result from question 15, add a derived column called DtDiff, this column 
should find the difference in month between the order date and ship date.
*/
SELECT
      OrderDate,
	  DueDate,
	  ShipDate,
	  DATEADD(DAY,30,DueDate)   ExtendedDueDate,
	  DATEADD(MONTH,2,ShipDate) ExtendShipDt,
	  DATEDIFF(MONTH,OrderDate,ShipDate)
FROM Sales.SalesOrderHeader

/*QUESTION 17
Write a query against the Employee table to display the job title, birth date and 
marital status, hire date, vacation hours and sick leave hours
Now, add a derived column called Age. This column should hold the the age of the employee when
when there where employeed. 
Note: Remember this is a little tricky you just have to think outside the box.
Hint: DateDiff 
*/
SELECT
     JobTitle,
	 BirthDate,
	 MaritalStatus,
	 HireDate,
	 VacationHours,
	 SickLeaveHours,
	 DATEDIFF(YEAR, BirthDate, HireDate) AS AGE
FROM HumanResources.Employee

/* QUESTION 18
Write a SQL query against the customer table to generate dataset that will display the store ID,
Territory ID and account number. Add a derived column called SubNumber that will return every
values after the AW on the account number
*/

SELECT
     StoreID,
	 TerritoryID,
	 AccountNumber,
	 --LEFT(AccountNumber,2) FIRST2,
	 REPLACE(AccountNumber,LEFT(AccountNumber,2),' ') FinalAns,
	 RIGHT(AccountNumber, 8) AS SubNumber
FROM Sales.Customer

/*QUESTION 19
Your company is about a make a business decision and they need to know what sales territory 
has hit their target based on the last year sales and the salesYTD (year to date). They
want you to Write a query to retrieve relievant information(Please pick columns that you will like to see in a normal reporting)
 from the SalesTerritory table  and then add a derived column called 'Target' that will display the following:
    If the territory's SalesLastYear exceeds salesYTD , display 'Not met'
	 else display 'Met'.
*/
SELECT
	 TerritoryID,
	 SalesLastYear,
	 SalesYTD,
	 CASE
	 WHEN SalesLAstYear > SalesYTD THEN 'Not met'
	 ELSE 'Met'
	 END AS Target
FROM Sales.SalesTerritory

/*QUESTION 20
Wirte SQL Query to retrieve the job title and birthday.
Create a derived column called Age that will hold the age of all the employees 
as of the day you are writing the query. 
Note: You will have to use the current data and the birth date to find the age
*/
SELECT
     JobTitle,
	 BirthDate,
	 GETDATE() AS CurrentDate,
	 DATEDIFF(YEAR,BirthDate,GETDATE()) AS AGE
FROM HumanResources.Employee

/*QUESTION 21
Write a SQL query to retrieve the phone number and modified date from the Person.PersonPhone

*/
SELECT
      PhoneNumber,
	  ModifiedDate
FROM Person.PersonPhone

/* QUESTION 22
You manager noticed that the dataset you generated in question 21, have the modified data 
displaying both date and time and he/she wants you to only display date and not time on the modified date
*/
SELECT
      PhoneNumber,
	  ModifiedDate,
	  CAST(ModifiedDate AS Date) AS ModifiedDate
FROM Person.PersonPhone

/*QUESTION 23
Using your result from question 22, please add a derived column called Last4Phone
 that will retrieve the last four value of the phone number
*/
SELECT
      PhoneNumber,
	  ModifiedDate,
	  CAST(ModifiedDate AS Date) AS ModifiedDate,
	  RIGHT(PhoneNumber,4) AS Last4Phone
FROM Person.PersonPhone

/*QUESTION 24
Using your result from question 23, add a column called asterisk and this
column should generate 8 asterisk (*)
*/
SELECT
      PhoneNumber,
	  ModifiedDate,
	  CAST(ModifiedDate AS Date) AS ModifiedDate,
	  RIGHT(PhoneNumber,4) AS Last4Phone,
	  REPLICATE('*',8) AS ASTERIK 
FROM Person.PersonPhone

/*QUESTION 25
Using your result from question 24, add a column called MaskPhone and this
column should mask the phone number and only displaying the last four 
while the rest will return *. See expected output below.
If phone number is 697-555-0142 then MaskPhone should be ********0142
*/
SELECT
      PhoneNumber,
	  ModifiedDate,
	  CAST(ModifiedDate AS Date) AS ModifiedDate,
	  RIGHT(PhoneNumber,4) AS Last4Phone,
	  REPLICATE('*',8) AS ASTERIK, 
	  CONCAT(REPLICATE('*',8),RIGHT(PhoneNumber, 4)) AS MaskPhone
FROM Person.PersonPhone
