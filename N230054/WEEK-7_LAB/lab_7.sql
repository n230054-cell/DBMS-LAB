use gram_panchayat_databaseb;
show tables;
select *from certificate_application;
select *from certificate_type;
select *from citizen;
select *from panchayat_office;

create view certificate_application1 as
select * from certificate_application;

select * from certificate_application1;

create view certificate_application2 as
select application_id,citizen_id,application_status
from certificate_application;

select * from certificate_application2;

create view certificate_application3 as
select * from certificate_application
where application_status='approved';

select * from certificate_application3;

create view certificate_application4 as
select * 
from certificate_application
where application_status='approved';

select * from certificate_application4;

show full tables
where Table_type='VIEW';

create view  certname_applicationdate as 
select c.certificate_name,a.applicationa_date
from certificate_type c
JOIN certificate_application a
on c.application_id=a.application_id;