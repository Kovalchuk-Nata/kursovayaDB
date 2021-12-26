 -- view
create view certificates as
select certificate_zno.id, abiturient.Surname, abiturient.Name, abiturient.MiddleName,
 abiturient.Passport_Id as PassportId, avg(Grade) as CompetitiveScore
	from certificate_zno
	inner join abiturient on certificate_zno.Abiturient_Id = abiturient.Id
	group by Passport_Id;  

select * from certificates; -- 

create view abitForFICT as
select application.Id, faculty.Abbreviation as Faculty, SpecialityId as Speciality, AbiturientId, CertificateId, certificates.CompetitiveScore,
eql.EQLName as EQL, form_of_education.FOE as FOE, form_of_payment_for_education.FOPFE as FOPFE
 from application
 inner join faculty on application.FacultyId = faculty.id
 inner join certificates on application.CertificateId = certificates.id
 inner join eql on application.EQLId = eql.id 
 inner join form_of_education on application.FOEId = form_of_education.id
 inner join form_of_payment_for_education on application.FOPFE = form_of_payment_for_education.id
 where eql.id = 1 and faculty.id = 1
 order by id;
 
 select * from abitForFICT; -- абитуриенты что подались на фиот