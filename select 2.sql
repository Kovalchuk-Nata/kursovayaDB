
 select * from certificates
        where CompetitiveScore > (SELECT AVG(CompetitiveScore) FROM certificates)
        order by CompetitiveScore ; 
        -- 12 вывод тех у кого средний бал выше среднего
	
select Id, Surname, Name, MiddleName, BirthDate, Passport_Id
 from abiturient
 where TIMESTAMPDIFF(year, BirthDate, CURRENT_DATE) < 18;
  -- 13 вывод тех кому меньше 18
  
select  faculty.Abbreviation, SpecialityId as Speciality, AVG(certificates.CompetitiveScore) as Average_score
  from application
  join certificates on application.AbiturientId = certificates.Id
  join faculty on application.FacultyId = faculty.id
group by SpecialityId
order by Abbreviation, Speciality;
-- 14 средний балл по специальности


select faculty.Abbreviation as faculty, SpecialityId as speciality, count(application.id) as count
from application
join faculty on faculty.id = application.FacultyId
group by SpecialityId;
-- 15 кол-во людей что подали заявки на специальность

select 
    application.Id,
    AbiturientId,
    SpecialityId,
    (speciality.CompetitiveScore - application.AbitCompetitiveScore) AS score,
    CompetitiveScore,
    AbitCompetitiveScore
from application
        join speciality on application.SpecialityId = speciality.id
where (speciality.CompetitiveScore - application.AbitCompetitiveScore) > 0
order by SpecialityId;
-- 16 люди которым нехватило баллов чтоб пройти порог на специальность 

select * from certificates;
select Id, CompetitiveScore from  speciality;

select faculty.Abbreviation as faculty,
 SpecialityId as speciality,
 count(application.id) as countOfApplication,
 min(AbitCompetitiveScore) as minScore
from application
join faculty on faculty.id = application.FacultyId
group by SpecialityId;
-- 17 кол-во заяв на спецу и мин балл

select faculty.Abbreviation as faculty,
 SpecialityId as speciality,
 count(application.id) as countOfApplication,
 max(AbitCompetitiveScore) as maxScore
from application
join faculty on faculty.id = application.FacultyId
group by SpecialityId;
-- 18 кол-во заяв на спецу и макс балл

select Id, Surname, Name, MiddleName, BirthDate, Phone_number 
from abiturient
where Surname in ('Березенко');
-- поиск по фамилии

/*insert abiturient
values
 (30, 'Кассандра', 'Семенівна', 'Качинська', "2000-08-13", 312332, 9999, "380(97)197-76-87", '981c@gmail.com', 27 , 'пл. Леніна, 81', 'ЗОШ І-ІІІ ст. №235', '2020-05-31', null),
(31, 'Дарина', 'Іванівна', 'Давиденко', "2000-03-28",  333333, 8888,  "380(97)024-87-45", '9darina@ukr.net', 28, 'пл. Перемоги, 43', 'Ліцей №293', '2020-05-31',  null);
*/
 select abiturient.Id, Surname, Name, MiddleName, BirthDate, Passport_Id, city.CityName as city, country.CountryNames as country from abiturient
  left join city on abiturient.Ab_City = city.id
  left join country on city.CountryId = country.id
   where CountryNames not in ('Україна');
  
select faculty.Abbreviation as faculty, SpecialityId as speciality, count(application.id) as count, max(AbitCompetitiveScore)
from application
join faculty on faculty.id = application.FacultyId
group by SpecialityId;
  
  
select abiturient.Id, Surname, Name, MiddleName, Ab_Privilege from abiturient
 left join  privilege
 on abiturient.Ab_Privilege = privilege.id;
 
 -- select Id, FacultyId, SpecialityId,   from application
  -- 14 количество людей подавших заявки на очное и заочное
 Select CURRENT_DATE();
 select Id, Surname, Name, MiddleName, TIMESTAMPDIFF(year, BirthDate, CURRENT_DATE) as eee
 from abiturient;