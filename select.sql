use kursovayadb;

select id, Surname, Name, MiddleName, BirthDate, (SELECT Ab_Privilege FROM privilege 
        WHERE privilege.Id = abiturient.Ab_Privilege) as Privilege
        from abiturient
where Ab_Privilege is not null; 
-- 1 выводим льготников 

select count(Surname) as CountAbiturient, Ab_Privilege as IdPrivilege, privilege.PrivilegeDescritpion as Privilege
        from abiturient
inner join privilege on privilege.Id = abiturient.Ab_Privilege
where Ab_Privilege is not null
group by Privilege; 
-- 2 выводим количество льготников по группам

SELECT 
    abiturient.id,
    Surname,
    Name,
    MiddleName,
    BirthDate,
    Passport_Id,
    Passport_Seria,
    Phone_number,
    City.CityName AS City,
    Adress,
    School,
    Graduation_date,
    privilege.PrivilegeDescritpion AS Privilege
FROM
    abiturient
        INNER JOIN
    City ON city.Id = abiturient.Ab_City
        INNER JOIN
    Privilege ON privilege.Id = abiturient.Ab_Privilege; 
        -- 3 полная инфа по льготникам
        
 select certificate_zno.id, Abiturient_Id, subjects.SubjectName as subjects, Grade
		from certificate_zno
 inner join subjects on certificate_zno.SubjectId = subjects.Id
 order by Abiturient_Id, SubjectId ; 
 -- 4 кто что сдавал + оценки 
 
select certificate_zno.id, abiturient.Surname, abiturient.Name, abiturient.MiddleName, abiturient.Passport_Id as PassportId, avg(Grade) as CompetitiveScore
 from certificate_zno
 inner join abiturient on certificate_zno.Abiturient_Id = abiturient.Id
 group by Passport_Id; 
 -- 5 абитуриент + конкурсный балл
 
select * from application;

select application.Id, faculty.Abbreviation as Faculty, SpecialityId as Speciality, AbiturientId, CertificateId, certificates.CompetitiveScore,
eql.EQLName as EQL, form_of_education.FOE as FOE, form_of_payment_for_education.FOPFE as FOPFE
 from application
 inner join faculty on application.FacultyId = faculty.id
 inner join certificates on application.CertificateId = certificates.id
 inner join eql on application.EQLId = eql.id
 inner join form_of_education on application.FOEId = form_of_education.id
 inner join form_of_payment_for_education on application.FOPFE = form_of_payment_for_education.id
 order by  eql, foe;  
 -- 6 красивый application
 
 select application.Id, faculty.Abbreviation as Faculty, SpecialityId as Speciality, AbiturientId, CertificateId, certificates.CompetitiveScore,
eql.EQLName as EQL, form_of_education.FOE as FOE, form_of_payment_for_education.FOPFE as FOPFE
 from application
 inner join faculty on application.FacultyId = faculty.id
 inner join certificates on application.CertificateId = certificates.id
 inner join eql on application.EQLId = eql.id 
 inner join form_of_education on application.FOEId = form_of_education.id
 inner join form_of_payment_for_education on application.FOPFE = form_of_payment_for_education.id
 where eql.id = 1
 order by  eql, foe;  
 -- 7 вывод только бакалавров
 
 select application.Id, faculty.Abbreviation as Faculty, SpecialityId as Speciality, AbiturientId, CertificateId, certificates.CompetitiveScore,
eql.EQLName as EQL, form_of_education.FOE as FOE, form_of_payment_for_education.FOPFE as FOPFE
 from application
 inner join faculty on application.FacultyId = faculty.id
 inner join certificates on application.CertificateId = certificates.id
 inner join eql on application.EQLId = eql.id 
 inner join form_of_education on application.FOEId = form_of_education.id
 inner join form_of_payment_for_education on application.FOPFE = form_of_payment_for_education.id
 where eql.id = 2
 order by  eql, foe;  
 -- 8 вывод только магистров
 
SELECT 
    application.Id,
    faculty.Abbreviation AS Faculty,
    SpecialityId AS Speciality,
    AbiturientId,
    CertificateId,
    certificates.CompetitiveScore,
    eql.EQLName AS EQL,
    form_of_education.FOE AS FOE,
    form_of_payment_for_education.FOPFE AS FOPFE
 from application
 inner join faculty on application.FacultyId = faculty.id
 inner join certificates on application.CertificateId = certificates.id
 inner join eql on application.EQLId = eql.id 
 inner join form_of_education on application.FOEId = form_of_education.id
 inner join form_of_payment_for_education on application.FOPFE = form_of_payment_for_education.id
 where eql.id = 1 and faculty.id = 1
 order by id; 
 -- 9 выбор только тех кто бакалавр и подался на фиот
 
 
select * from city;
 
 select  abiturient.id, Surname, Name, MiddleName, BirthDate, Passport_Id, Passport_Seria, Phone_number, City.CityName as City, Adress,
 application.Dormitory as Dormitory
        from abiturient
        inner join City on city.Id = abiturient.Ab_City
        inner join application on abiturient.Id = application.AbiturientId
		where City.id not in (26)
        order by Dormitory desc; 
        -- 10 список тех кому нужно общежитие + абитуриенты не из киева
          
select  abiturient.id as AbitId, Surname, Name, MiddleName, BirthDate, Passport_Id, application.Dormitory as DormitoryNeed
        from abiturient
        inner join City on city.Id = abiturient.Ab_City
        inner join abitForFICT on abiturient.Id = abitForFICT.AbiturientId
        inner join application on abiturient.Id = application.AbiturientId
		where City.id not in (26)
        order by DormitoryNeed desc, AbitId; 
        -- 11 кому с фиота нужно общежитие + ребята должны быть не из киева
   
 select * from abitForFICT;
 
 
 
 