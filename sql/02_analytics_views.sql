
--Name: Amy Sauden
--Date: 10/7/2025

USE ER_Hospital
GO


CREATE VIEW PatientVisitReport AS
(SELECT        dbo.Patient.Patient_ID, dbo.Patient.Patient_LastName AS Patient_Name, dbo.Staff.Staff_First AS Staff_Name, dbo.Staff.Staff_Position, dbo.Diagnosis.Diagnosis_Name, dbo.Diagnosis.Diagnosis_Charge, 
                         dbo.Insurance.Insurance_Name, dbo.Visit.Visit_Date
FROM            dbo.Patient INNER JOIN
                         dbo.Insurance ON dbo.Patient.Insurance_ID = dbo.Insurance.Insurance_ID INNER JOIN
                         dbo.Visit ON dbo.Patient.Patient_ID = dbo.Visit.Patient_ID INNER JOIN
                         dbo.Diagnosis ON dbo.Visit.Diagnosis_ID = dbo.Diagnosis.Diagnosis_ID INNER JOIN
                         dbo.Staff ON dbo.Visit.Staff_ID = dbo.Staff.Staff_ID)

GO

CREATE VIEW StaffActivity AS
(SELECT        dbo.Staff.Staff_ID, dbo.Staff.Staff_First, dbo.Staff.Staff_Last, dbo.Visit.Visit_ID AS Total_Visits, dbo.Diagnosis.Diagnosis_ID, dbo.Diagnosis.Diagnosis_Charge AS Total_Revenue
FROM            dbo.Staff INNER JOIN
                         dbo.Visit ON dbo.Staff.Staff_ID = dbo.Visit.Staff_ID INNER JOIN
                         dbo.Diagnosis ON dbo.Visit.Diagnosis_ID = dbo.Diagnosis.Diagnosis_ID)


