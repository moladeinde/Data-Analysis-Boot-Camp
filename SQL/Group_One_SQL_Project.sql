
/* NAME MONISOLA OLADEINDE
        BABATUNDE ADEWALE
		STEPHANIE NYAMEKWE
*/
USE [PollynzConsults]
GO

--QUESTION 1
SELECT
     FirstName,
     MiddleName,
     LastName,
	 Name
FROM Hr.Employee HE
INNER JOIN Hr.Shift HS
ON he.ShiftID = hs.ShiftID


-- QUESTION 2 
SELECT
      FirstName,
      MiddleName,
      LastName,
      BirthDate,
      JobTitle,
      VacationHours,
      Addressline1,
      City,
      ZipCode
FROM Hr.Employee


--QUESTION 3
SELECT
      FirstName,
      MiddleName,
      LastName,
      BirthDate,
      JobTitle,
      VacationHours,
	  CONCAT(AddressLine1,' ',City,' ',State,' ',ZipCode) FullAddress
FROM Hr.Employee


--QUESTION 4 
SELECT
      PatientFirstName,
	  PatientLastName,
	  Gender,
	  SSN,
	  Dateofbirth,
	  cpc.ChargedID,
	  CAST(InpatientCharges AS Money) AS InpatientCharges,
	  CAST(OutPatientCharges AS Money) AS OutpatientCharges,
	  CAST(InpatientCharges AS Money) + CAST(OutPatientCharges AS Money) AS Total
FROM Clients.Patients CP
INNER JOIN Clients.PatientCharges CPC
ON cp.ChargedID = cpc.ChargedID
WHERE CAST(InpatientCharges AS Money) + CAST(OutPatientCharges AS Money) > 2000


-- QUESTION 5
SELECT
      PatientFirstName,
	  PatientLastName,
	  Gender,
	  SSN,
	  Dateofbirth,
	  cpc.ChargedID,
	  Name,
	  DrugName,
	  CAST(InpatientCharges AS Money) AS InpatientCharges,
	  CAST(OutPatientCharges AS Money) AS OutpatientCharges,
	  CAST(InpatientCharges AS Money) + CAST(OutPatientCharges AS Money) AS Total
FROM Clients.Patients CP
INNER JOIN Clients.PatientCharges CPC
ON cp.ChargedID = cpc.ChargedID
INNER JOIN clients.MedicalCondition CMC
ON cmc.DiagonosisID = cp.DiagonosisId                                  
INNER JOIN clients.Medication   CM
ON cm.DiagonosisId = cp.DiagonosisID
WHERE CAST(InpatientCharges AS Money) + CAST(OutPatientCharges AS Money) > 2000


--QUESTION 6
SELECT
     PatientFirstName,
     PatientLastName,
     cp.Gender,
     hir.ReportId,
     Name
FROM Hr.Employee HR
INNER JOIN Clients.Patients CP
ON cp.Gender = hr.Gender
INNER JOIN Hr.IncidentReports HIR
ON hir.ReportId = cp.ReportId


--QUESTION 7
SELECT
     PatientFirstName,
     PatientLastName,
     cp.Gender,
     hir.ReportId,
     Name,
     FirstName,
     LastName,
     CAST(IncidentDate AS Date)	AS IncidentDate,
     EmailAddress
FROM Hr.Employee HR
INNER JOIN Clients.Patients CP
ON cp.Gender = hr.Gender
INNER JOIN Hr.IncidentReports HIR
ON hir.ReportId = cp.ReportId


--QUESTION 8 
SELECT
      PatientFirstName,
	  PatientLastName,
	  Gender,
	  CONCAT(REPLICATE('*',8), RIGHT(SSN,4)) AS MaskedLst4,
	  Dateofbirth,
	  cpc.ChargedID,
	  CAST(InpatientCharges AS Money) AS InpatientCharges,
	  CAST(OutPatientCharges AS Money) AS OutpatientCharges,
	  CAST(InpatientCharges AS Money) + CAST(OutPatientCharges AS Money) AS Total
FROM Clients.Patients CP
INNER JOIN Clients.PatientCharges CPC
ON cp.ChargedID = cpc.ChargedID
WHERE CAST(InpatientCharges AS Money) + CAST(OutPatientCharges AS Money) > 2000


--QUESTION 9 
SELECT
     LEFT(PatientFirstName,3) AS 'FirstThree',
     RIGHT(PatientFirstName,3)AS 'LastThree',
     RIGHT(SSN,4) AS 'LastFour',
     CONCAT(LEFT(PatientFirstName,3),'',RIGHT(PatientFirstName,3),'',RIGHT(SSN,4)) AS 'Unique ID'
FROM Clients.Patients


--QUESTION 10 
SELECT
     FirstName,
     LastName,
     Gender,
     MaritalStatus,
     DATENAME(YEAR,HireDate) AS 'AwardDate',
     CASE
     WHEN Gender = 'M' THEN 'Male' 
	 WHEN Gender = 'F' THEN 'Female'
     ELSE Gender
     END AS GenderTrans,
	 CASE
	 WHEN MaritalStatus = 'M' THEN 'Married'
	 WHEN MaritalStatus = 'S'  THEN 'Single'
	 ELSE MaritalStatus
	 END AS MaritalStatusTrans
FROM Hr.Employee

--QUESTION 11 

CREATE VIEW vEmpInfo
AS
(
SELECT	
     FirstName,
     LastName,
     Gender,
     MaritalStatus,
     DATENAME(YEAR,HireDate) AS 'AwardDate',
     CASE
     WHEN Gender = 'M' THEN 'Male' 
	 WHEN Gender = 'F' THEN 'Female'
     ELSE Gender
     END AS GenderTrans,
	 CASE
	 WHEN MaritalStatus = 'M' THEN 'Married'
	 WHEN MaritalStatus = 'S'  THEN 'Single'
	 ELSE MaritalStatus
	 END AS MaritalStatusTrans
FROM Hr.Employee
)

CREATE VIEW vLast4FNameInOutpatientGendTrans
AS
(
SELECT
      PatientFirstName,
	  PatientMiddleName,
	  PatientLastName,
	  Gender,
	  Dateofbirth,
	  cpc.ChargedID,
	  CONCAT(REPLICATE('*',8), RIGHT(SSN,4)) AS MaskedLst4,
	  CONCAT(PatientFirstName,' ', PatientMiddleName,' ',PatientLastName) AS PatientFullName,
	  CAST(InpatientCharges AS Money) AS InpatientCharges,
	  CAST(OutPatientCharges AS Money) AS OutpatientCharges,
	  CAST(InpatientCharges AS Money) + CAST(OutPatientCharges AS Money) AS Total,
	  CASE
      WHEN Gender = 'M' THEN 'Male' 
	  WHEN Gender = 'F' THEN 'Female'
      ELSE Gender
      END AS PatientGender,
	  CASE
	  WHEN CAST(InpatientCharges AS Money) > CAST(OutPatientCharges AS Money) THEN 'In is Greater'
	  WHEN CAST(OutPatientCharges AS Money)> CAST (InpatientCharges AS Money) THEN 'Out is Greater'
	  ELSE 'Null'
	  END AS ChargedValidation
FROM Clients.Patients CP
INNER JOIN Clients.PatientCharges CPC
ON cp.ChargedID = cpc.ChargedID
)



