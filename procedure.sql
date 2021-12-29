use kursovayadb;

 drop procedure if exists abit_score;
delimiter $$
create procedure abit_score(in Abit_Id int)
begin
	declare abit_score float;
	select round(avg(grade), 2) into abit_score from certificate_zno where Abiturient_Id=Abit_Id;
    update application set AbitCompetitiveScore=abit_score where AbiturientId=Abit_Id;
end $$
delimiter ;

call abit_score(3);

-- процедура подсчета среднего балла ЗНО по всем абитуриентам
drop procedure if exists abit_all_count_score;
delimiter $$
create procedure abit_all_count_score()
begin
  declare done int default 0;
  declare a int;  
  declare cur cursor for select id from abiturient;
  declare CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  open cur;

repeat
    fetch cur into a; -- a = id
    call abit_score(a);
until done end repeat;

  close cur;
end $$
delimiter ;


-- процедура подсчета в процентном отношении количества абитуриентов, у которых средний бал по ЗНО больше 190, больше 180 и больше 170 
drop procedure if exists abit_statistic_score;
delimiter $$
create procedure abit_statistic_score()
begin
	declare all_abit int;
    select  count(distinct AbiturientId) into all_abit from application where AbitCompetitiveScore > 0;
	select all_abit as "Count of abiturients",
    (select round((count(*)/all_abit)*100, 2) from application where AbitCompetitiveScore > 190) as "% абитуриентов с баллом более 190",
    (select round((count(*)/all_abit)*100, 2) from application where AbitCompetitiveScore > 180) as "% абитуриентов с баллом более 180",
    (select round((count(*)/all_abit)*100, 2) from application where AbitCompetitiveScore > 170) as "% абитуриентов с баллом более 170";
    
end $$
delimiter ;

CALL abit_statistic_score();
 
alter table application
modify AbitCompetitiveScore float default 0;



select  count(distinct AbiturientId)  from application where AbitCompetitiveScore > 0;
