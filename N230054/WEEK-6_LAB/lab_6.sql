USE gram_panchayat_db;

SELECT * FROM citizen;
SELECT * FROM certificate_application;
SELECT * FROM certificate_type;
SELECT * FROM panchayat_office;
SELECT MAX(application_date) AS latest_application_date FROM certificate_application;
SELECT MIN(application_date) AS earliest_application_date FROM certificate_application;
SELECT * FROM certificate_application WHERE
application_date=(SELECT MAX(application_date) FROM certificate_application);
SELECT * FROM certificate_application WHERE
application_date=(SELECT MIN(application_date) FROM certificate_application);
SELECT * FROM citizen WHERE citizen_id IN (
SELECT citizen_id FROM certificate_application
WHERE application_status='Approved');
SELECT * FROM certificate_application WHERE
application_date > (SELECT MIN(application_date) FROM certificate_application);
SELECT * FROM certificate_application WHERE
application_date < (SELECT MAX(application_date) FROM certificate_application);

SELECT *
FROM citizen
WHERE citizen_id IN
(
SELECT citizen_id
FROM certificate_application
);

SELECT *
FROM citizen
WHERE citizen_id NOT IN
(
SELECT citizen_id
FROM certificate_application
WHERE application_status = 'Approved'
);

SELECT *
FROM certificate_type
WHERE certificate_type_id IN
(
SELECT certificate_id
FROM certificate_application
WHERE application_status = 'Approved'
);

SELECT *
FROM certificate_type
WHERE certificate_type_id NOT IN
(
SELECT certificate_id
FROM certificate_application
WHERE application_status = 'Approved'
);

SELECT *
FROM certificate_application
WHERE application_date >
(
SELECT MIN(application_date)
FROM certificate_application
);

SELECT
ct.certificate_name,
a.application_date
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
WHERE a.application_date =
(
SELECT MAX(application_date)
FROM certificate_application
);

SELECT
ct.certificate_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_name
ORDER BY total_applications DESC
LIMIT 1;

SELECT
p.office_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_name
ORDER BY total_applications DESC
LIMIT 1;

SELECT
ct.certificate_name,
COUNT() AS total_applications
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_name
HAVING COUNT() >
(
SELECT AVG(application_count)
FROM
(
SELECT COUNT(*) AS application_count
FROM certificate_application
GROUP BY certificate_id
) AS certificate_counts
);

SELECT
p.office_name,
COUNT() AS total_applications
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_name
HAVING COUNT() > ANY
(
SELECT application_count
FROM
(
SELECT COUNT(*) AS application_count
FROM certificate_application
GROUP BY office_id
) AS office_counts
);

SELECT
p.office_name,
COUNT() AS total_applications
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_name
HAVING COUNT() >= ALL
(
SELECT application_count
FROM
(
SELECT COUNT(*) AS application_count
FROM certificate_application
GROUP BY office_id
) AS office_counts
);

SELECT
ct.certificate_name,
a.application_date
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
WHERE a.application_date =
(
SELECT MAX(application_date)
FROM certificate_application
);

SELECT
c.full_name,
COUNT() AS total_applications
FROM citizen c
INNER JOIN certificate_application a
ON c.citizen_id = a.citizen_id
GROUP BY c.citizen_id, c.full_name
HAVING COUNT() > 1;

SELECT
application_status,
COUNT( ) AS total_applications
FROM certificate_application
GROUP BY application_status
HAVING COUNT() =
(
SELECT MAX(status_count)
FROM
(
SELECT COUNT(*) AS status_count
FROM certificate_application
GROUP BY application_status
) AS status_counts
);

SELECT *
FROM certificate_application
WHERE application_date =
(
SELECT MAX(application_date)
FROM certificate_application
);

SELECT *
FROM certificate_application
WHERE application_date =
(
SELECT MIN(application_date)
FROM certificate_application
);

SELECT *
FROM citizen
WHERE citizen_id IN
(
SELECT citizen_id
FROM certificate_application
WHERE application_status = 'Approved'
);

SELECT
ct.certificate_name
FROM certificate_type ct
WHERE ct.certificate_type_id IN
(
SELECT certificate_id
FROM certificate_application
)
AND ct.certificate_type_id NOT IN
(
SELECT certificate_id
FROM certificate_application
WHERE application_status = 'Approved'
);

SELECT
p.office_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_id, p.office_name
ORDER BY total_applications DESC
LIMIT 1;

SELECT
ct.certificate_name,
COUNT() AS total_applications
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_type_id, ct.certificate_name
HAVING COUNT() >
(
SELECT AVG(application_count)
FROM
(
SELECT COUNT(*) AS application_count
FROM certificate_application
GROUP BY certificate_id
) AS certificate_counts
);

SELECT
ct.certificate_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_type_id, ct.certificate_name
ORDER BY total_applications DESC
LIMIT 1;

SELECT
ct.certificate_name,
COUNT(*) AS total_applications,
MIN(a.application_date) AS earliest_application_date,
MAX(a.application_date) AS latest_application_date
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_type_id, ct.certificate_name;