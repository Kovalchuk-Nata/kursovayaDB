-- создать триггер который будет подсчитывать количество добавленных 
-- предметов для Абитуриента в таблицу certificate_zno и, если количество предметов равно 3, 
-- то подсчитывать Процедурой средний балл по трем предметам и записывать его в поле application.AbitCompetitiveScore
-- Нужно сделать копию триггера для `after insert`

drop trigger if exists `cert_after_update`;  -- удаление триггера

-- добавление триггера
delimiter $$
create trigger `cert_after_update` after update
	on `certificate_zno` 
	for each row 
		begin    
			declare co_subjects int;
			select count(*) into co_subjects from certificate_zno where Abiturient_Id=new.Abiturient_Id;
			if co_subjects = 3 then 
				call abit_score(new.Abiturient_Id);
		   end if;         
		end $$
 delimiter ;
 
 delimiter $$
create trigger `cert_after_insert` after insert
	on `certificate_zno` 
	for each row 
		begin    
			declare co_subjects int;
			select count(*) into co_subjects from certificate_zno where Abiturient_Id=new.Abiturient_Id;
			if co_subjects = 3 then 
				call abit_score(new.Abiturient_Id);
		   end if;         
		end $$
 delimiter ;


drop trigger if exists `application_after_insert`;  -- удаление триггера

-- добавление триггера
delimiter $$
create
	trigger `application_after_insert` after insert 
	on `application` 
	for each row begin
    
	declare var1 int; -- 
    
    select COUNT(*) into var1 from application where AbiturientId=new.AbiturientId;
    
	update abiturient set Sum_application = var1 where Id = new.AbiturientId;
		
    end$$
 delimiter ;
 -- триггер отрабатывает после добавления записи в таблицу application - after insert
 -- он считает количество заявлений от абитуриента и вносит это количество в поле Sum_application в таблице abiturient
 

 
 
 -- проверка
 insert into application values (37, 2, 113, 1, 1, 0, 1, 1, 3, 0); -- для пользователя с id=1
  insert into application values (37, 2, 113, 1, 1, 0, 1, 1, 3, 0); -- для пользователя с id=1