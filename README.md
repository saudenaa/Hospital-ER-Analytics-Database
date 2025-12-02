# Hospital ER Analytics Database
A structured SQL Server database that models Emergency Room (ER) operations, including patients, staff, diagnoses, insurance providers, and visit activity. Designed for analytics, reporting, and realistic healthcare data workflows.

---

## 1. Project Overview
This project represents how Emergency Rooms organise and store clinical and operational data. It uses a fully normalised relational schema, synthetic sample data, analytical SQL views, and role-based access control. The dataset supports common healthcare analysis such as visit history, diagnosis cost, staff workload, and insurance reporting.

---

## 2. Entity–Relationship Diagram (ERD)
The ERD reflects the core relationships between Patient, Staff, Diagnosis, Insurance, and Visit.

Place your ERD image in:

/images/ERD_diagram.png

yaml
Copy code

Display it in the README:

```md
![ERD Diagram](images/ERD_diagram.png)
3. Database Schema (SQL)
sql
Copy code
-- Insurance Table
CREATE TABLE Insurance (
    InsuranceID SMALLINT PRIMARY KEY,
    InsuranceName VARCHAR(25)
);

-- Patient Table
CREATE TABLE Patient (
    Patient_ID SMALLINT PRIMARY KEY,
    Insurance_ID SMALLINT FOREIGN KEY REFERENCES Insurance(InsuranceID),
    First_Name VARCHAR(60),
    Last_Name VARCHAR(60),
    DOB DATE,
    SSN CHAR(9)
);

-- Staff Table
CREATE TABLE Staff (
    Staff_ID SMALLINT PRIMARY KEY,
    First_Name VARCHAR(60),
    Last_Name VARCHAR(60),
    Position VARCHAR(50)
);

-- Diagnosis Table
CREATE TABLE Diagnosis (
    Diagnosis_ID SMALLINT PRIMARY KEY,
    Diagnosis VARCHAR(100),
    Charge DECIMAL(15,5),
    Diagnosis_Quantity SMALLINT
);

-- Visit Table (Fact Table)
CREATE TABLE Visit (
    Visit_ID SMALLINT PRIMARY KEY,
    Patient_ID SMALLINT FOREIGN KEY REFERENCES Patient(Patient_ID),
    Visit_Date DATETIME,
    Staff_ID SMALLINT FOREIGN KEY REFERENCES Staff(Staff_ID),
    Diagnosis_ID SMALLINT FOREIGN KEY REFERENCES Diagnosis(Diagnosis_ID)
);
4. Sample Data (INSERT Statements)
sql
Copy code
-- Insurance Providers
INSERT INTO Insurance (InsuranceName)
VALUES ('Aetna'), ('Blue Cross'), ('United Health'), ('Cigna'), ('Humana'),
('Medicare'), ('MediAssist'), ('CareSource'), ('HealthPlus'), ('Tricare');

-- Patients
INSERT INTO Patient (Insurance_ID, First_Name, Last_Name, DOB, SSN)
VALUES
(1,'John','Smith','1990-04-12','123456789'),
(2,'Maria','Lopez','1985-09-22','234567891'),
(3,'David','Brown','1979-03-10','345678912'),
(4,'Sophia','Taylor','1995-07-15','456789123'),
(5,'Michael','Johnson','1988-11-03','567891234'),
(6,'Emily','Williams','1999-01-09','678912345'),
(7,'James','Davis','1993-05-20','789123456'),
(8,'Olivia','Miller','2000-02-25','891234567'),
(9,'Daniel','Garcia','1982-12-14','912345678'),
(10,'Grace','Martinez','1997-08-07','102345678');

-- Staff
INSERT INTO Staff (First_Name, Last_Name, Position)
VALUES
('Robert','King','Doctor'),
('Anna','Moore','Nurse'),
('William','Clark','Surgeon'),
('Jessica','Hall','Receptionist'),
('Thomas','Allen','Technician'),
('Isabella','Baker','Nurse'),
('Andrew','Nelson','Pharmacist'),
('Megan','Parker','Therapist'),
('Jacob','Adams','Doctor'),
('Lily','Scott','Administrator');

-- Diagnoses
INSERT INTO Diagnosis (Diagnosis, Charge, Diagnosis_Quantity)
VALUES
('Flu',80,1),('Fracture',500,1),('Migraine',120,2),('Allergy',90,1),
('Asthma',250,1),('Infection',200,1),('Back Pain',150,1),
('Sprain',100,1),('Fever',75,1),('Diabetes',300,1);

-- Visit Records
INSERT INTO Visit (Patient_ID, Visit_Date, Staff_ID, Diagnosis_ID)
VALUES
(1,'2025-10-01 09:00:00',1,1),
(2,'2025-09-15 11:00:00',3,2),
(3,'2025-09-10 10:30:00',2,3),
(4,'2025-09-18 14:00:00',5,4),
(5,'2025-08-25 08:45:00',7,5),
(6,'2025-09-05 16:00:00',4,6),
(7,'2025-09-20 12:00:00',8,7),
(8,'2025-10-02 13:15:00',6,8),
(9,'2025-09-29 09:45:00',9,9),
(10,'2025-10-03 15:00:00',10,10);
5. Analytics Views
sql
Copy code
-- Patient Visit Report
CREATE VIEW PatientVisitReport AS
SELECT 
    p.First_Name, p.Last_Name, p.DOB, p.SSN,
    v.Visit_Date,
    s.First_Name AS Staff_First, s.Last_Name AS Staff_Last, s.Position,
    d.Diagnosis, d.Charge,
    i.InsuranceName
FROM Visit v
JOIN Patient p ON v.Patient_ID = p.Patient_ID
JOIN Staff s ON v.Staff_ID = s.Staff_ID
JOIN Diagnosis d ON v.Diagnosis_ID = d.Diagnosis_ID
JOIN Insurance i ON p.Insurance_ID = i.InsuranceID;

-- Staff Activity Summary
CREATE VIEW StaffActivitySummary AS
SELECT 
    s.Staff_ID, s.First_Name, s.Last_Name, s.Position,
    COUNT(v.Visit_ID) AS Total_Visits,
    SUM(d.Charge) AS Total_Revenue
FROM Staff s
LEFT JOIN Visit v ON s.Staff_ID = v.Staff_ID
LEFT JOIN Diagnosis d ON v.Diagnosis_ID = d.Diagnosis_ID
GROUP BY s.Staff_ID, s.First_Name, s.Last_Name, s.Position;
6. Security & Access Control
sql
Copy code
-- Admin User
CREATE LOGIN ER_Admin WITH PASSWORD='Admin@123';
CREATE USER ER_Admin_User FOR LOGIN ER_Admin;
ALTER ROLE db_owner ADD MEMBER ER_Admin_User;

-- Limited Access User
CREATE LOGIN ER_Limited WITH PASSWORD='Limited@123';
CREATE USER ER_Limited_User FOR LOGIN ER_Limited;
GRANT SELECT, INSERT ON SCHEMA::dbo TO ER_Limited_User;

-- Read-Only User
CREATE LOGIN ER_ReadOnly WITH PASSWORD='ReadOnly@123';
CREATE USER ER_ReadOnly_User FOR LOGIN ER_ReadOnly;
EXEC sp_addrolemember 'db_datareader','ER_ReadOnly_User';
7. How to Run
Create the database

Run the schema file (01_database_schema.sql)

Insert data (02_insert_data.sql)

Create views (03_analytics_views.sql)

Run security script (04_security_roles.sql)

Query the views:

sql
Copy code
SELECT * FROM PatientVisitReport;
SELECT * FROM StaffActivitySummary;
8. Project Structure
pgsql
Copy code
/sql
   01_database_schema.sql
   02_insert_data.sql
   03_analytics_views.sql
   04_security_roles.sql

/images
   ERD_diagram.png

/docs
   project_documentation.pdf
9. Author
Amy Sauden – Cybersecurity & Data Technology
