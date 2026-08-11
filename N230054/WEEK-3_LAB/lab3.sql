USE gram_panchayat_db;

SHOW TABLES;

SELECT * FROM Citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Panchayat_Office;
SELECT * FROM Certificate_Application;

ALTER TABLE Certificate_Application ADD certificate_type_id INT;
ALTER TABLE Certificate_Application ADD office_id INT;

UPDATE Certificate_Application ca
JOIN Certificate_Type ct
ON ca.certificate_name = ct.certificate_name
SET ca.certificate_type_id = ct.certificate_type_id;

UPDATE Certificate_Application ca
JOIN Citizen c
ON ca.citizen_id = c.citizen_id
JOIN Panchayat_Office po
ON c.village_name = po.village_name
SET ca.office_id = po.office_id;

ALTER TABLE Certificate_Application
ADD CONSTRAINT fk_citizen
FOREIGN KEY (citizen_id) REFERENCES Citizen(citizen_id);

ALTER TABLE Certificate_Application
ADD CONSTRAINT fk_certificate
FOREIGN KEY (certificate_type_id) REFERENCES Certificate_Type(certificate_type_id);

ALTER TABLE Certificate_Application
ADD CONSTRAINT fk_office
FOREIGN KEY (office_id) REFERENCES Panchayat_Office(office_id);

SELECT * FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Certificate_Application';

SELECT * FROM Citizen;
SELECT * FROM Certificate_Application;
SELECT full_name FROM Citizen ORDER BY full_name;
SELECT DISTINCT village_name FROM Citizen;
SELECT DISTINCT certificate_name FROM Certificate_Type;
SELECT DISTINCT office_name FROM Panchayat_Office;
SELECT * FROM Certificate_Application WHERE application_status = 'Submitted';
SELECT * FROM Citizen WHERE village_name = 'Ramapuram';
SELECT * FROM Certificate_Application WHERE YEAR(application_date) = 2026;
SELECT * FROM Certificate_Application ORDER BY application_date DESC;

SELECT * FROM Certificate_Application ca
JOIN Panchayat_Office po
ON ca.office_id = po.office_id
WHERE po.office_name = 'Nuzvid';

SELECT c.full_name
FROM Citizen c
JOIN Certificate_Application ca
ON c.citizen_id = ca.citizen_id
WHERE ca.certificate_name = 'Income Certificate';

SELECT full_name FROM Citizen c
JOIN Certificate_Application ca
ON c.citizen_id = ca.citizen_id
WHERE ca.certificate_name = 'Income Certificate'
UNION
SELECT full_name FROM Citizen c
JOIN Certificate_Application ca
ON c.citizen_id = ca.citizen_id
WHERE ca.certificate_name = 'Residence Certificate';

SELECT * FROM Certificate_Application WHERE MONTH(application_date) = 1
UNION
SELECT * FROM Certificate_Application WHERE MONTH(application_date) = 2;

SELECT * FROM Citizen WHERE village_name = 'Ramapuram'
UNION
SELECT * FROM Citizen WHERE village_name = 'Lakshmipuram';

SELECT citizen_id FROM Certificate_Application WHERE certificate_name = 'Income Certificate'
INTERSECT
SELECT citizen_id FROM Certificate_Application WHERE certificate_name = 'Residence Certificate';

SELECT citizen_id FROM Certificate_Application WHERE YEAR(application_date) = 2025
INTERSECT
SELECT citizen_id FROM Certificate_Application WHERE YEAR(application_date) = 2026;

SELECT citizen_id FROM Certificate_Application WHERE certificate_name = 'Income Certificate'
EXCEPT
SELECT citizen_id FROM Certificate_Application WHERE certificate_name = 'Residence Certificate';

SELECT * FROM Certificate_Application WHERE YEAR(application_date) = 2026
EXCEPT
SELECT * FROM Certificate_Application WHERE YEAR(application_date) = 2025;

INSERT INTO Certificate_Application VALUES (2001,999,'Income Certificate','2026-08-01','Test','Submitted',30.00,'REF999');

DELETE FROM Citizen WHERE citizen_id = 101;

SELECT full_name FROM Citizen
WHERE citizen_id IN (SELECT citizen_id FROM Certificate_Application);

SELECT * FROM Citizen
WHERE village_name IN (
SELECT c.village_name
FROM Citizen c
JOIN Certificate_Application ca
ON c.citizen_id = ca.citizen_id
WHERE ca.certificate_name = 'Income Certificate'
);

SELECT * FROM Citizen
WHERE citizen_id NOT IN (
SELECT citizen_id FROM Certificate_Application
);

SELECT * FROM Panchayat_Office
WHERE office_id NOT IN (
SELECT office_id FROM Certificate_Application
);

SELECT full_name FROM Citizen c
WHERE EXISTS (
SELECT * FROM Certificate_Application ca
WHERE ca.citizen_id = c.citizen_id
);

SELECT certificate_name FROM Certificate_Type ct
WHERE EXISTS (
SELECT * FROM Certificate_Application ca
WHERE ca.certificate_type_id = ct.certificate_type_id
);

SELECT full_name v  