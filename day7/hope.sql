CREATE DATABASE HOPE;
USE HOPE;
CREATE TABLE Patients (

    PatientID INT PRIMARY KEY,

    PatientName VARCHAR(50),

    Age INT,

    Gender VARCHAR(10),

    City VARCHAR(50),

    Disease VARCHAR(50),

    BillAmount DECIMAL(10,2)

);
 
CREATE TABLE Doctors (

    DoctorID INT PRIMARY KEY,

    DoctorName VARCHAR(50),

    Specialization VARCHAR(50),

    Salary DECIMAL(10,2),

    City VARCHAR(50)

);
 
CREATE TABLE Treatments (

    TreatmentID INT PRIMARY KEY,

    PatientID INT,

    DoctorID INT,

    TreatmentName VARCHAR(50),

    TreatmentCost DECIMAL(10,2),

    TreatmentDate DATE

);
USE HOPE;

INSERT INTO Patients VALUES
(1, 'Rahul', 35, 'Male', 'Delhi', 'Heart Disease', 25000),
(2, 'Priya', 28, 'Female', 'Mumbai', 'Fever', 3000),
(3, 'Amit', 45, 'Male', 'Delhi', 'Diabetes', 12000),
(4, 'Neha', 32, 'Female', 'Chennai', 'Migraine', 8000),
(5, 'Rohit', 50, 'Male', 'Mumbai', 'Heart Disease', 35000),
(6, 'Sneha', 25, 'Female', 'Chennai', 'Asthma', 4500),
(7, 'Karan', 55, 'Male', 'Delhi', 'Heart Disease', 45000),
(8, 'Anjali', 30, 'Female', 'Mumbai', 'Skin Allergy', 2500),
(9, 'Vikas', 40, 'Male', 'Chennai', 'Diabetes', 15000),
(10, 'Pooja', 27, 'Female', 'Delhi', 'Fever', 2000),
(11, 'Arjun', 42, 'Male', 'Mumbai', 'Kidney Disease', 28000),
(12, 'Divya', 24, 'Female', 'Chennai', 'Fever', 1500);


INSERT INTO Doctors VALUES
(101, 'Dr Sharma', 'Cardiology', 120000, 'Delhi'),
(102, 'Dr Gupta', 'General Medicine', 75000, 'Mumbai'),
(103, 'Dr Mehta', 'Cardiology', 150000, 'Chennai'),
(104, 'Dr Kumar', 'Neurology', 95000, 'Delhi'),
(105, 'Dr Singh', 'Dermatology', 65000, 'Mumbai'),
(106, 'Dr Ravi', 'Endocrinology', 85000, 'Chennai'),
(107, 'Dr Khan', 'Nephrology', 110000, 'Mumbai'),
(108, 'Dr Patel', 'Orthopedics', 90000, 'Delhi');


INSERT INTO Treatments VALUES
(1001, 1, 101, 'ECG', 5000, '2026-01-10'),
(1002, 1, 103, 'Heart Treatment', 20000, '2026-01-12'),
(1003, 2, 102, 'General Checkup', 1000, '2026-01-13'),
(1004, 2, 102, 'Medicine', 2000, '2026-01-14'),
(1005, 3, 106, 'Blood Test', 2000, '2026-01-15'),
(1006, 3, 106, 'Insulin Therapy', 10000, '2026-01-16'),
(1007, 4, 104, 'MRI Scan', 8000, '2026-01-18'),
(1008, 5, 101, 'ECG', 5000, '2026-01-20'),
(1009, 5, 103, 'Heart Treatment', 30000, '2026-01-22'),
(1010, 6, 102, 'Asthma Treatment', 4500, '2026-01-24'),
(1011, 7, 103, 'Heart Surgery', 40000, '2026-01-25'),
(1012, 7, 101, 'ECG', 5000, '2026-01-26'),
(1013, 8, 105, 'Skin Treatment', 2500, '2026-02-01'),
(1014, 9, 106, 'Blood Test', 3000, '2026-02-02'),
(1015, 9, 106, 'Diabetes Treatment', 12000, '2026-02-03'),
(1016, 10, 102, 'General Checkup', 1000, '2026-02-04'),
(1017, 10, 102, 'Medicine', 1000, '2026-02-05'),
(1018, 11, 107, 'Kidney Treatment', 28000, '2026-02-06'),
(1019, 12, 102, 'Fever Treatment', 1500, '2026-02-07');


SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Treatments;
 
 select PatientName,BillAmount
 from Patients
 where BillAmount>(Select AVG(BillAmount) from Patients);
 select DoctorName 
 from Doctors d
 where NOT EXISTS(
    select 1
    from treatments t
    where d.DoctorID=t.DoctorID);
SELECT DoctorName, Salary
FROM Doctors
WHERE Salary > ALL (
    SELECT Salary
    FROM Doctors
    WHERE City = 'Mumbai'
);
SELECT PatientName, City, BillAmount
FROM Patients p1
WHERE BillAmount > (
    SELECT AVG(BillAmount)
    FROM Patients p2
    WHERE p1.City = p2.City
);
SELECT PatientName
FROM Patients p
WHERE NOT EXISTS (
    SELECT 1
    FROM Treatments t
    WHERE p.PatientID = t.PatientID
    AND t.TreatmentCost > 5000
);
SELECT DoctorName, Salary
FROM Doctors
WHERE Salary > ANY (
    SELECT Salary
    FROM Doctors
    WHERE City = 'Delhi'
);
SELECT d.DoctorName,
       COUNT(DISTINCT t.PatientID) AS TotalPatients
FROM Doctors d
JOIN Treatments t
ON d.DoctorID = t.DoctorID
GROUP BY d.DoctorID, d.DoctorName
HAVING COUNT(DISTINCT t.PatientID) >= ALL (
    SELECT COUNT(DISTINCT PatientID)
    FROM Treatments
    GROUP BY DoctorID
);
SELECT p.PatientName,
       SUM(t.TreatmentCost) AS TotalCost
FROM Patients p
JOIN Treatments t
ON p.PatientID = t.PatientID
GROUP BY p.PatientID, p.PatientName
HAVING SUM(t.TreatmentCost) > (
    SELECT AVG(Total)
    FROM (
        SELECT SUM(TreatmentCost) AS Total
        FROM Treatments
        GROUP BY PatientID
    ) AS PatientTotals
);

 