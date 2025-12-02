USE ER_Hospital;
GO

-- Insert into Insurance
INSERT INTO Insurance (Insurance_Name)
VALUES 
('Aetna'), ('Blue Cross'), ('United Health'), ('Cigna'), 
('Humana'), ('MediCare'), ('MediAssist'), ('CareSource'), 
('HealthPlus'), ('Tricare');

-- Insert into Patient
INSERT INTO Patient (Insurance_ID, Patien_FirstName, Patient_LastName, DOB, SSN)
VALUES
(1, 'John', 'Smith', '1990-04-12', '123456789'),
(2, 'Maria', 'Lopez', '1985-09-22', '234567891'),
(3, 'David', 'Brown', '1979-03-10', '345678912'),
(4, 'Sophia', 'Taylor', '1995-07-15', '456789123'),
(5, 'Michael', 'Johnson', '1988-11-03', '567891234'),
(6, 'Emily', 'Williams', '1999-01-09', '678912345'),
(7, 'James', 'Davis', '1993-05-20', '789123456'),
(8, 'Olivia', 'Miller', '2000-02-25', '891234567'),
(9, 'Daniel', 'Garcia', '1982-12-14', '912345678'),
(10, 'Grace', 'Martinez', '1997-08-07', '102345678');

-- Insert into Staff
INSERT INTO Staff (Staff_First, Staff_Last, Staff_Position)
VALUES
('Robert', 'King', 'Doctor'),
('Anna', 'Moore', 'Nurse'),
('William', 'Clark', 'Surgeon'),
('Jessica', 'Hall', 'Receptionist'),
('Thomas', 'Allen', 'Technician'),
('Isabella', 'Baker', 'Nurse'),
('Andrew', 'Nelson', 'Pharmacist'),
('Megan', 'Parker', 'Therapist'),
('Jacob', 'Adams', 'Doctor'),
('Lily', 'Scott', 'Administrator');

-- Insert into Diagnosis
INSERT INTO Diagnosis (Diagnosis_Name, Diagnosis_Charge, Diagnosis_Quantity)
VALUES
('Flu', 80.00, 1),
('Fracture', 500.00, 1),
('Migraine', 120.00, 2),
('Allergy', 90.00, 1),
('Asthma', 250.00, 1),
('Infection', 200.00, 1),
('Back Pain', 150.00, 1),
('Sprain', 100.00, 1),
('Fever', 75.00, 1),
('Diabetes', 300.00, 1);

-- Insert into Visit
INSERT INTO Visit (Patient_ID, Visit_Date, Staff_ID, Diagnosis_ID)
VALUES
(1, '2025-10-01 09:00:00', 1, 1),
(2, '2025-09-15 11:00:00', 3, 2),
(3, '2025-09-10 10:30:00', 2, 3),
(4, '2025-09-18 14:00:00', 5, 4),
(5, '2025-08-25 08:45:00', 7, 5),
(6, '2025-09-05 16:00:00', 4, 6),
(7, '2025-09-20 12:00:00', 8, 7),
(8, '2025-10-02 13:15:00', 6, 8),
(9, '2025-09-29 09:45:00', 9, 9),
(10, '2025-10-03 15:00:00', 10, 10);
