USE gram_panchayat_db;
SHOW TABLES;
SELECT * FROM citizen;
SELECT * FROM certificate_type;
SELECT * FROM certificate_application;
SELECT * FROM panchayat_office;
SELECT UPPER(full_name) AS full_name FROM citizen;
SELECT LOWER(village_name) AS village_name FROM citizen;
SELECT full_name,LENGTH(full_name) AS name_length FROM citizen;
SELECT reference_number,LEFT(reference_number,4) AS first_four FROM certificate_application;
SELECT CONCAT(full_name,'-',village_name) AS details FROM citizen;
SELECT REPLACE(certificate_name,'Certificate','cert') AS certificate_name FROM certificate_type;
SELECT TRIM(certificate_name) AS certificate_name From certificate_type;
SELECT SUBSTRING_INDEX(full_name,' ',1) AS first_name FROM citizen;
SELECT CONCAT('citizen :',full_name,'\n','village :',village_name) AS display_info FROM citizen;
SELECT * FROM certificate_application WHERE reference_number LIKE 'GP2026%';
SELECT application_fee,ROUND(application_fee) AS rounded_fee FROM certificate_type;
SELECT processing_days,ABS(processing_days-10) AS absolute_value FROM certificate_type;
SELECT processing_days,POWER(processing_days,2) AS square FROM certificate_type;
SELECT processing_days,MOD(processing_days,3) AS remaining FROM certificate_type;
SELECT application_fee,ROUND(application_fee,1) AS rounded_fee FROM certificate_type;
SELECT application_fee,CEIL(application_fee) AS celling_value,
FLOOR(application_fee) AS floor_value FROM certificate_type;
SELECT FLOOR(RAND() * 100) +1 AS random_number;
SELECT processing_days,ABS(processing_days-10) AS absolute_value FROM certificate_type;
SELECT processing_days,SQRT(processing_days) AS square_root FROM certificate_type;
SELECT certificate_name,processing_days,processing_days*2 AS doubled_processing_days FROM certificate_type;
#PART=D
SELECT CURDATE() AS today_date;
SELECT NOW() AS current_date_time;
SELECT application_date,YEAR(application_date) AS year FROM certificate_application;
SELECT application_date,MONTH(application_date) AS month FROM certificate_application;
SELECT application_date,DAY(application_date) AS day FROM certificate_application;
SELECT ca.application_date,ct.processing_days,DATE_ADD(ca.application_date,INTERVAL ct.processing_days DAY) AS issue_date
FROM certificate_application ca JOIN certificate_type ct ON ca.certificate_name=ct.certificate_name;
SELECT application_date,DATE_ADD(application_date,INTERVAL 30 DAY) AS after_30_days
FROM certificate_application;
SELECT application_date,
DATE_SUB(application_date,INTERVAL 7 DAY)
AS before_7_days
FROM certificate_application;
SELECT application_date,DATEDIFF(CURDATE(),application_date) AS days_difference
FROM certificate_application;
SELECT * FROM certificate_application WHERE YEAR(application_date) =YEAR(CURDATE());
SELECT application_fee,CAST(application_fee AS SIGNED) AS integer_fee FROM certificate_type;
SELECT processing_days,CAST(processing_days AS CHAR)AS char_days FROM certificate_type;
SELECT application_date,CAST(application_date AS DATETIME) AS datetime_value FROM certificate_application;
SELECT processing_days,CAST(processing_days AS DECIMAL(10,2)) AS decimal_days FROM certificate_type;
SELECT CONVERT(application_fee,CHAR) AS fee_string FROM certificate_type;
SELECT processing_days,CAST(processing_days AS SIGNED)+5 AS result FROM certificate_type;