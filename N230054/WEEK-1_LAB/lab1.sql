CREATE DATABASE IF NOT EXISTS gram_panchayat_db;

USE gram_panchayat_db;

CREATE TABLE Citizen (
citizen_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
gender VARCHAR(10) NOT NULL,
mobile_number VARCHAR(15) UNIQUE NOT NULL,
occupation VARCHAR(50),
village_name VARCHAR(50) NOT NULL,
is_active BOOLEAN NOT NULL
);

CREATE TABLE Certificate_Type (
certificate_type_id INT PRIMARY KEY,
certificate_name VARCHAR(100) UNIQUE NOT NULL,
description VARCHAR(200) NOT NULL,
processing_days INT NOT NULL,
application_fee DECIMAL(8,2) NOT NULL,
is_available BOOLEAN NOT NULL
);

CREATE TABLE Certificate_Application (
application_id INT PRIMARY KEY,
citizen_id INT NOT NULL,
certificate_name VARCHAR(100) NOT NULL,
application_date DATE NOT NULL,
purpose VARCHAR(200) NOT NULL,
application_status VARCHAR(30) NOT NULL,
fee_paid DECIMAL(8,2) NOT NULL,
reference_number VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE Panchayat_Office (
office_id INT PRIMARY KEY,
office_name VARCHAR(100) NOT NULL,
village_name VARCHAR(50) NOT NULL,
pincode VARCHAR(6) NOT NULL,
contact_number VARCHAR(15) UNIQUE,
office_email VARCHAR(100) UNIQUE,
opening_time TIME NOT NULL,
is_operational BOOLEAN NOT NULL
);

INSERT INTO Citizen VALUES
(101,'Ravi Kumar','1995-06-15','Male','9876500001','Farmer','Ramapuram',TRUE),
(102,'Lakshmi Devi','1988-11-22','Female','9876500002','Tailor','Ramapuram',TRUE),
(103,'Suresh Babu','1992-03-10','Male','9876500003','Shopkeeper','Seethampeta',TRUE),
(104,'Anjali Rao','2000-08-05','Female','9876500004','Student','Ramapuram',TRUE),
(105,'Kiran Kumar','1985-01-18','Male','9876500005','Electrician','Seethampeta',TRUE),
(106,'Meena Kumari','1998-12-30','Female','9876500006','Teacher','Lakshmipuram',FALSE);

INSERT INTO Certificate_Type VALUES
(1,'Residence Certificate','Residence proof',7,30.00,TRUE),
(2,'Birth Record Request','Birth record',5,20.00,TRUE),
(3,'Death Record Request','Death record',5,20.00,TRUE),
(4,'Family Member Certificate','Family details',10,40.00,TRUE),
(5,'Property Certificate','Property record',15,50.00,TRUE),
(6,'No-Dues Certificate','Dues status',7,25.00,FALSE);

INSERT INTO Certificate_Application VALUES
(1001,101,'Residence Certificate','2026-07-01','Bank','Submitted',30.00,'GP20260001'),
(1002,102,'Family Member Certificate','2026-07-02','Welfare','Under Review',40.00,'GP20260002'),
(1003,103,'Property Certificate','2026-07-03','Property','Submitted',50.00,'GP20260003'),
(1004,104,'Residence Certificate','2026-07-04','College','Approved',30.00,'GP20260004'),
(1005,105,'No-Dues Certificate','2026-07-05','Service','Under Review',25.00,'GP20260005'),
(1006,106,'Birth Record Request','2026-07-06','Personal','Rejected',20.00,'GP20260006');

INSERT INTO Panchayat_Office VALUES
(1,'Ramapuram Office','Ramapuram','521101','0866000001','ramapuram@gp.com','09:00:00',TRUE),
(2,'Seethampeta Office','Seethampeta','521102','0866000002','seethampeta@gp.com','09:30:00',TRUE),
(3,'Lakshmipuram Office','Lakshmipuram','521103','0866000003','lakshmipuram@gp.com','09:00:00',TRUE),
(4,'Krishnapuram Office','Krishnapuram','521104','0866000004','krishnapuram@gp.com','10:00:00',TRUE),
(5,'Venkatapuram Office','Venkatapuram','521105','0866000005','venkatapuram@gp.com','09:30:00',TRUE),
(6,'Gopalapuram Office','Gopalapuram','521106','0866000006','gopalapuram@gp.com','09:00:00',FALSE);

INSERT INTO Citizen VALUES (107,'Test User','2000-01-01','Male','9876500010','Student','TestVillage',TRUE);

INSERT INTO Certificate_Type VALUES (7,'Income Certificate','Income proof',8,35.00,TRUE);

UPDATE Certificate_Application SET application_status='Under Review' WHERE application_id=1001;

UPDATE Certificate_Application SET application_status='Approved' WHERE application_id=1002;

UPDATE Citizen SET occupation='Electrical Technician' WHERE citizen_id=105;

UPDATE Certificate_Type SET processing_days=12 WHERE certificate_type_id=5;

UPDATE Certificate_Type SET is_available=TRUE WHERE certificate_type_id=6;

DELETE FROM Citizen WHERE citizen_id=107;

ALTER TABLE Citizen ADD address VARCHAR(200);

ALTER TABLE Certificate_Application ADD issued_date DATE;

ALTER TABLE Certificate_Application MODIFY purpose VARCHAR(300);

ALTER TABLE Panchayat_Office ADD closing_time TIME;

CREATE TABLE Temporary_Request (
request_id INT PRIMARY KEY,
request_name VARCHAR(100) NOT NULL,
request_date DATE NOT NULL
);

INSERT INTO Temporary_Request VALUES
(1,'Req1','2026-07-01'),
(2,'Req2','2026-07-02'),
(3,'Req3','2026-07-03');

SELECT * FROM Temporary_Request;

TRUNCATE TABLE Temporary_Request;

DROP TABLE Temporary_Request;
SELECT * FROM Citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Certificate_Application;
SELECT * FROM Panchayat_Office;