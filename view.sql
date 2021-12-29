 -- view
CREATE VIEW certificates AS
    SELECT 
        certificate_zno.id,
        abiturient.Surname,
        abiturient.Name,
        abiturient.MiddleName,
        abiturient.Passport_Id AS PassportId,
        AVG(Grade) AS CompetitiveScore
    FROM
        certificate_zno
            INNER JOIN
        abiturient ON certificate_zno.Abiturient_Id = abiturient.Id
    GROUP BY Passport_Id;  

select * from certificates; -- вьюшка что считает конкурсный бал абитуриента

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
 
 