
CREATE DATABASE  if not exists gram_panchayat_db ;
USE gram_panchayat_db;
SHOW DATABASES;
SHOW TABLES;
CREATE TABLE citizen(citizen_id INT PRIMARY KEY,full_name VARCHAR(100) NOT NULL,date_of_birth DATE NOT NULL,
gender VARCHAR(10) NOT NULL,mobile_number VARCHAR(15) UNIQUE NOT NULL,occupation VARCHAR(50),village_name VARCHAR(50) NOT NULL,
is_active BOOLEAN NOT NULL);
SHOW TABLES;
CREATE TABLE certificate_type(certificate_type_id INT PRIMARY KEY,certificate_name VARCHAR(100) UNIQUE NOT NULL,
description VARCHAR(200) NOT NULL,processing_days INT NOT NULL,is_avaliable BOOLEAN NOT NULL);
SHOW TABLES;
CREATE TABLE certificate_application(application_id INT PRIMARY KEY,citizen_id INT NOT NULL,certificate_name VARCHAR(100) NOT NULL,
application_date DATE NOT NULL,purpose VARCHAR(200) NOT NULL,application_status VARCHAR(30) NOT NULL,fee_paid DECIMAL(8,2) NOT NULL,
reference_number VARCHAR(30) UNIQUE NOT NULL);
CREATE TABLE panchayat_office(office_id INT PRIMARY KEY,office_name VARCHAR(50) NOT NULL,village_name VARCHAR(50) NOT NULL,
pincode VARCHAR(6) NOT NULL,contact_number VARCHAR(15) UNIQUE,office_email VARCHAR(100) UNIQUE,opening_time TIME NOT NULL,
is_operational BOOLEAN NOT NULL);
INSERT INTO citizen(citizen_id,full_name,date_of_birth,gender,mobile_number,occupation,village_name,is_active)
VALUES (101,'Ravi Kumar','1995-06-15','Male','9876500001','Farmer','Ramapuram',TRUE),
(102,'Lakshmi Devi','1988-11-22','Female','9876500002','Tailor','Ramapuram',TRUE),
(103,'Suresh Babu','1992-03-10','Male','9876500003','Shopkeeper','Sethampeta',TRUE),
(104,'Anjali Rao','2000-08-05','Female','9876500004','Student','Ramapuram',TRUE),
(105,'Kiran Kumar','1985-01-18','Male','9876500005','Electrician','Seethapuram',TRUE),
(106,'Meena Kumari','1998-12-30','Female','9876500006','Teacher','Lakshmipuram',FALSE);
SELECT * FROM citizen;
DROP TABLE certificate_type;
CREATE TABLE certificate_type(certificate_type_id INT PRIMARY KEY,certificate_name VARCHAR(100) UNIQUE NOT NULL,
description VARCHAR(200) NOT NULL,processing_days INT NOT NULL,application_fee DECIMAL(8,2) NOT NULL,is_avaliable BOOLEAN NOT NULL);
INSERT INTO certificate_type(certificate_type_id,certificate_name,description,processing_days,application_fee,is_avaliable)
VALUES
('1','Residence Certificate','Certifies the declared place of residence',7,30.00,TRUE),
('2','Birth Record Request','Request for a locally maintained birth record',5,20.00,TRUE),
('3','Death Record Request','Request for a locally maintained death record',5,20.00,TRUE),
('4','Family Member Certificate','Records decalred family members',10,40.00,TRUE),
('5','Property Certificate','Certificate related to locally maintained property records',15,50.00,TRUE),
('6','No-Dues Certificate','indicates applicable local dues status',7,25.00,FALSE);
SELECT * FROM certificate_type;
INSERT INTO certificate_application(application_id,citizen_id,certificate_name,
application_date ,purpose,application_status,fee_paid,
reference_number)
VALUES
(1001,101,'Residence certificate','2026-07-01','Bank account documentation','Submitted',30.00,'GP20260001'),
(1002,102,'Family Member certificate','2026-07-02','Welfare scheme application','Under Review',40.00,'GP20260002'),
(1003,103,'Property certificate','2026-07-03','Property documentation','Submitted',50.00,'GP20260003'),
(1004,104,'Residence certificate','2026-07-04','College admission','Approved',30.00,'GP20260004'),
(1005,105,'No-Dues certificate','2026-07-05','Local service requirement','Under Review',25.00,'GP20260005'),
(1006,106,'Birth Record certificate','2026-07-06','Personal documention','Rejected',20.00,'GP20260006');
SELECT * FROM certificate_application;
INSERT INTO panchayat_office
(office_id,office_name,village_name,pincode,contact_number,office_email,opening_time,
is_operational)
VALUES
(1,'Ramapuram Gram Panchayat','Ramapuram','521101','0866000001','ramapuram@gp.example','09:00:00',TRUE),
(2,'Seethampeta Gram Panchayat','seethampeta','521102','0866000002','seethampeta@gp.example','09:30:00',TRUE),
(3,'Lakshmipuram Gram Panchayat','Lakshmipuram','521103','0866000003','lakshmipuram@gp.example','09:00:00',TRUE),
(4,'Krishnapuram Gram Panchayat','krishnapuram','521104','0866000004','krishnapuram@gp.example','10:00:00',TRUE),
(5,'Venkatapuram Gram Panchayat','venkatapuram','521105','0866000005','venkatapuram@gp.example','09:30:00',TRUE),
(6,'Gopalapiram Gram Panchayat','Gopalapuram','521106','0866000006','gopalapuram@gp.example','09:00:00',FALSE);
uSELECT * FROM panchayat_office;
INSERT INTO citizen
(citizen_id,full_name,date_of_birth,gender,mobile_number,occupation,village_name,is_active)
VALUES
(107,'Ramesh Kumar','1996-04-18','Male','9876500007','Farmer','Ramapuram',TRUE);
SELECT * FROM citizen;
INSERT INTO certificate_type
(certificate_type_id,certificate_name,description,processing_days,application_fee,is_avaliable)
VALUES
(7,'Income certificate','Certifies annual income of the applicant',7,35.00,TRUE);
SELECT * FROM certificate_type;
UPDATE certificate_application SET application_status='Under Review' WHERE application_id=1001;
SELECT * FROM certificate_application;
UPDATE certificate_application SET application_status='Approved' WHERE application_id=1002;
SELECT * FROM certificate_application;
UPDATE citizen SET occupation='Electrical Technician' WHERE citizen_id=105;
SELECT * FROM citizen;
UPDATE certificate_type SET processing_days=12 WHERE certificate_name='Property Certificate';
SELECT * FROM certificate_type;
UPDATE certificate_type SET is_avaliable=1 WHERE certificate_name='No-Dues Certificate';
SELECT * FROM certificate_type;
DELETE FROM citizen WHERE citizen_id=107;
SELECT * FROM citizen;
ALTER TABLE citizen ADD address VARCHAR(200);
SELECT * FROM citizen;
ALTER TABLE certificate_application ADD issued_data DATE;
SELECT * FROM certificate_application;
DESC certificate_application;
ALTER TABLE certificate_application CHANGE issued_data issued_date DATE;
ALTER TABLE certificate_application MODIFY purpose VARCHAR(500) NOT NULL;
DESC certificate_application;
ALTER TABLE panchayat_office ADD closing_time TIME;
DESC panchayat_office;
CREATE TABLE Temporary_Request(
request_id INT PRIMARY KEY,
request_name VARCHAR(100) NOT NULL,
request_data DATE NOT NULL);
INSERT INTO Temporary_Request
(request_id,request_name,request_data)
VALUES
(1,'income certificate','2026-07-20'),
(2,'Residence Certificate','2026-07-21'),
(3,'Birth Certificate','2026-07-22');
SELECT * FROM Temporary_Request;
TRUNCATE TABLE Temporary_Request;
SELECT * FROM Temporary_Request;
DROP TABLE Temporary_Request;
SHOW TABLES;
INSERT INTO citizen(citizen_id,full_name,date_of_birth,gender,mobile_number,occupation,village_name,is_active)
VALUES (101,'Test User','1995-01-01','Male','9876500009','Student','Ramapuram',TRUE);
INSERT INTO certificate_type
(certificate_type_id,description,processing_days,application_fee,is_avaliable)
VALUES
(8,'Test description',5,20.00,TRUE);
INSERT INTO certificate_application
(application_id,citizen_id,certificate_name,application_date,purpose,application_status,fee_paid,reference_number)
VALUES
(1007,101,'Residual Certificate','2026-07-10','Testing','Submitted',30.00,|
'GP20260001');