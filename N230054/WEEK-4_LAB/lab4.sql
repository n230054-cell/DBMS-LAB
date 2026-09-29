USE gram_panchayat_db;

SHOW TABLES;

SELECT * FROM citizen;
SELECT * FROM certificate_type;
SELECT * FROM panchayat_office;
SELECT * FROM certificate_application;
SELECT
c.full_name,
ct.certificate_name
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id;
SELECT
c.full_name,
p.office_name
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN panchayat_office p
ON a.office_id = p.office_id;

SELECT
a.application_id,
c.full_name,
a.application_status
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id;

SELECT
c.full_name,
ct.certificate_name,
a.application_date
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id;
SELECT
c.full_name,
ct.certificate_name,
p.office_name,
a.application_status
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
INNER JOIN panchayat_office p
ON a.office_id = p.office_id;

SELECT
c.full_name,
p.office_name,
ct.certificate_name
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
WHERE ct.certificate_name = 'Income Certificate';
SELECT
c.citizen_id,
c.full_name,
c.village_name,
a.application_id,
a.application_date,
a.application_status,
p.office_name
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
WHERE p.office_name = 'Nuzvid Panchayat Office';

SELECT
a.application_id,
ct.certificate_name,
ct.description,
a.application_status
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id;

SELECT
c.full_name,
c.village_name,
ct.certificate_name,
p.office_name,
a.application_date
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
INNER JOIN panchayat_office p
ON a.office_id = p.office_id;

SELECT
c.citizen_id,
c.full_name,
c.village_name,
ct.certificate_type_id,
ct.certificate_name,
ct.description,
p.office_id,
p.office_name,
a.application_id,
a.application_date,
a.application_status
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
INNER JOIN panchayat_office p
ON a.office_id = p.office_id;

SELECT
c.citizen_id,
c.full_name,
a.application_id,
a.application_status
FROM citizen c
LEFT JOIN certificate_application a
ON c.citizen_id = a.citizen_id;

SELECT
ct.certificate_type_id,
ct.certificate_name,
a.application_id,
a.application_status
FROM certificate_application a
RIGHT JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id;

SELECT
c.citizen_id,
c.full_name,
a.application_id,
a.application_status
FROM citizen c
LEFT JOIN certificate_application a
ON c.citizen_id = a.citizen_id

UNION

SELECT
c.citizen_id,
c.full_name,
a.application_id,
a.application_status
FROM citizen c
RIGHT JOIN certificate_application a
ON c.citizen_id = a.citizen_id;

SELECT
c.full_name,
ct.certificate_name
FROM citizen c
CROSS JOIN certificate_type ct;

SELECT
c1.full_name AS Citizen_1,
c2.full_name AS Citizen_2,
c1.village_name
FROM citizen c1
INNER JOIN citizen c2
ON c1.village_name = c2.village_name
AND c1.citizen_id < c2.citizen_id;