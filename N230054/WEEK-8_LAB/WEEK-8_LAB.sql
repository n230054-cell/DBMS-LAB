USE gram_panchayat_db;


SHOW TABLES;

SELECT * FROM Citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Panchayat_Office;
SELECT * FROM Certificate_Application;

SET AUTOCOMMIT = 0;

SELECT @@AUTOCOMMIT;

START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Under Review'
WHERE application_id = 1001;

SELECT *
FROM Certificate_Application
WHERE application_id = 1001;

ROLLBACK;

SELECT *
FROM Certificate_Application
WHERE application_id = 1001;

START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Approved',
    remarks = 'Approved after verification'
WHERE application_id = 1002;

SELECT *
FROM Certificate_Application
WHERE application_id = 1002;

COMMIT;

SELECT *
FROM Certificate_Application
WHERE application_id = 1002;


START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Rejected',
    remarks = 'Incorrectly rejected'
WHERE application_id = 1003;

SELECT *
FROM Certificate_Application
WHERE application_id = 1003;

ROLLBACK;

SELECT *
FROM Certificate_Application
WHERE application_id = 1003;



START TRANSACTION;

INSERT INTO Certificate_Application
(application_id, citizen_id, certificate_id, office_id,
 application_date, application_status)
VALUES
(1015, 101, 1, 1, '2026-07-15', 'Pending');

SELECT *
FROM Certificate_Application
WHERE application_id = 1015;

ROLLBACK;

SELECT *
FROM Certificate_Application
WHERE application_id = 1015;

START TRANSACTION;

DELETE FROM Certificate_Application
WHERE application_id = 1014;

SELECT *
FROM Certificate_Application
WHERE application_id = 1014;

ROLLBACK;

SELECT *
FROM Certificate_Application
WHERE application_id = 1014;



START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 1004;

UPDATE Certificate_Application
SET application_status = 'Rejected'
WHERE application_id = 1005;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1004, 1005);

COMMIT;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1004, 1005);


START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 1006;

SAVEPOINT application_update;

UPDATE Certificate_Application
SET application_status = 'Rejected'
WHERE application_id = 1007;

ROLLBACK TO SAVEPOINT application_update;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1006, 1007);

COMMIT;


START TRANSACTION;

INSERT INTO Certificate_Application
(application_id, citizen_id, certificate_id, office_id,
 application_date, application_status)
VALUES
(1016, 102, 2, 2, '2026-07-16', 'Pending');

SAVEPOINT new_application;

UPDATE Certificate_Application
SET application_status = 'Rejected'
WHERE application_id = 1008;

ROLLBACK TO SAVEPOINT new_application;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1016, 1008);

COMMIT;


START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 1009;

SAVEPOINT first_savepoint;

UPDATE Certificate_Application
SET application_status = 'Rejected'
WHERE application_id = 1010;

SAVEPOINT second_savepoint;

UPDATE Certificate_Application
SET application_status = 'Under Review'
WHERE application_id = 1011;

ROLLBACK TO SAVEPOINT first_savepoint;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1009, 1010, 1011);

COMMIT;


START TRANSACTION;

INSERT INTO Certificate_Application
(application_id, citizen_id, certificate_id, office_id,
 application_date, application_status)
VALUES
(1017, 103, 3, 1, '2026-07-17', 'Pending');

SAVEPOINT after_insert;

UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 1012;

SAVEPOINT after_update;

DELETE FROM Certificate_Application
WHERE application_id = 1013;

ROLLBACK TO SAVEPOINT after_update;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1012, 1013, 1017);

COMMIT;


START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 1002;

SAVEPOINT application_update;

RELEASE SAVEPOINT application_update;

ROLLBACK TO SAVEPOINT application_update;

COMMIT;


START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 1002;

SAVEPOINT first_change;

UPDATE Certificate_Application
SET application_status = 'Rejected'
WHERE application_id = 1005;

ROLLBACK TO SAVEPOINT first_change;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1002, 1005);

COMMIT;



DROP USER IF EXISTS 'clerk1'@'localhost';

CREATE USER 'clerk1'@'localhost'
IDENTIFIED BY 'Clerk@123';

SELECT User, Host
FROM mysql.user
WHERE User = 'clerk1';

GRANT SELECT
ON gram_panchayat_db.Certificate_Application
TO 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';


GRANT INSERT
ON gram_panchayat_db.Certificate_Application
TO 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';




SHOW GRANTS FOR 'clerk1'@'localhost';




GRANT SELECT
ON gram_panchayat_db.Approved_Applications
TO 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';




REVOKE INSERT
ON gram_panchayat_db.Certificate_Application
FROM 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';


DROP USER IF EXISTS 'clerk1'@'localhost';

CREATE USER 'clerk1'@'localhost'
IDENTIFIED BY 'Clerk@123';

GRANT SELECT, INSERT
ON gram_panchayat_db.Certificate_Application
TO 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';

DROP USER IF EXISTS 'officer1'@'localhost';

CREATE USER 'officer1'@'localhost'
IDENTIFIED BY 'Officer@123';

GRANT SELECT, INSERT, UPDATE
ON gram_panchayat_db.Certificate_Application
TO 'officer1'@'localhost';

SHOW GRANTS FOR 'officer1'@'localhost';




GRANT SELECT
ON gram_panchayat_db.Approved_Applications
TO 'officer1'@'localhost';

SHOW GRANTS FOR 'officer1'@'localhost';


GRANT SELECT, INSERT, UPDATE
ON gram_panchayat_db.Certificate_Application
TO 'clerk1'@'localhost';

REVOKE UPDATE
ON gram_panchayat_db.Certificate_Application
FROM 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';



SHOW GRANTS FOR 'clerk1'@'localhost';

SHOW GRANTS FOR 'officer1'@'localhost';


REVOKE UPDATE, DELETE
ON gram_panchayat_db.Certificate_Application
FROM 'clerk1'@'localhost';

GRANT SELECT, INSERT
ON gram_panchayat_db.Certificate_Application
TO 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';


START TRANSACTION;

INSERT INTO Certificate_Application
(application_id, citizen_id, certificate_id, office_id,
 application_date, application_status)
VALUES
(1018, 104, 4, 3, '2026-07-18', 'Pending');

SELECT *
FROM Certificate_Application
WHERE application_id = 1018;

COMMIT;

SELECT *
FROM Certificate_Application
WHERE application_id = 1018;


START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Rejected',
    remarks = 'Incorrect update'
WHERE application_id = 1018;

SELECT *
FROM Certificate_Application
WHERE application_id = 1018;

ROLLBACK;

SELECT *
FROM Certificate_Application
WHERE application_id = 1018;



START TRANSACTION;

UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 1009;

SAVEPOINT valid_change;

UPDATE Certificate_Application
SET application_status = 'Rejected'
WHERE application_id = 1010;

ROLLBACK TO SAVEPOINT valid_change;

SELECT *
FROM Certificate_Application
WHERE application_id IN (1009, 1010);

COMMIT;



SHOW GRANTS FOR 'clerk1'@'localhost';


GRANT SELECT
ON gram_panchayat_db.Approved_Applications
TO 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';

REVOKE INSERT
ON gram_panchayat_db.Certificate_Application
FROM 'clerk1'@'localhost';

SHOW GRANTS FOR 'clerk1'@'localhost';


USE gram_panchayat_db;

SHOW TABLES;

SELECT *
FROM Certificate_Application;

SELECT @@AUTOCOMMIT;

SET AUTOCOMMIT = 1;

SELECT @@AUTOCOMMIT;

SELECT CURRENT_USER();

SHOW GRANTS FOR 'clerk1'@'localhost';

SHOW GRANTS FOR 'officer1'@'localhost';




DROP USER IF EXISTS 'clerk1'@'localhost';

DROP USER IF EXISTS 'officer1'@'localhost';