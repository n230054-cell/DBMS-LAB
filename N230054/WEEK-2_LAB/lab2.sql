use gram_panchayat_db;

show tables;

select upper(full_name) from Citizen;

select lower(village_name) from Citizen;

select length(full_name) from Citizen;

select substring(reference_number,1,4) from Certificate_Application;

select concat(full_name,' - ',village_name) from Citizen;

select replace(certificate_name,'Certificate','Cert.') from Certificate_Type;

select trim(certificate_name) from Certificate_Type;

select substring(full_name,1,locate(' ',full_name)-1) from Citizen;

select concat('Citizen : ',full_name,' Village : ',village_name) from Citizen;

select * from Certificate_Application
where reference_number like 'GP2026%';

select round(application_fee) from Certificate_Application;

select abs(processing_days-10) from Certificate_Application;

select power(processing_days,2) from Certificate_Application;

select mod(processing_days,3) from Certificate_Application;

select round(application_fee,1) from Certificate_Application;

select ceil(application_fee),floor(application_fee) from Certificate_Application;

select floor(rand()*100)+1;

select sqrt(processing_days) from Certificate_Application;

select processing_days*2 from Certificate_Application;

select curdate();

select now();

select year(application_date) from Certificate_Application;

select month(application_date) from Certificate_Application;

select day(application_date) from Certificate_Application;

select date_add(application_date, interval processing_days day) from Certificate_Application;

select date_add(application_date, interval 30 day) from Certificate_Application;

select date_sub(application_date, interval 7 day) from Certificate_Application;

select datediff(curdate(),application_date) from Certificate_Application;

select * from Certificate_Application
where year(application_date)=year(curdate());

select cast(application_fee as signed) from Certificate_Application;

select cast(processing_days as char) from Certificate_Application;

select cast(application_date as datetime) from Certificate_Application;

select cast(processing_days as decimal(10,2)) from Certificate_Application;

select cast(application_fee as char) from Certificate_Application;

select processing_days + cast(application_fee as signed) from Certificate_Application;