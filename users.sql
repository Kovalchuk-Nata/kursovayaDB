-- користувачі

create user 'administrator'@'localhost' identified by 'admin';
grant all privileges on kursovayadb.* to 'administrator'@'localhost';
-- адміністратор, що має всі можливості

create user'moderator'@'localhost' identified by 'moder';
grant select ON kursovayadb.*  to 'moderator'@'localhost';
grant insert ON kursovayadb.abiturient  to 'moderator'@'localhost';
grant insert ON kursovayadb.application  to 'moderator'@'localhost';
grant insert ON kursovayadb.certificate_zno  to 'moderator'@'localhost';
grant insert ON kursovayadb.city  to 'moderator'@'localhost';
grant insert ON kursovayadb.country  to 'moderator'@'localhost';
grant update ON kursovayadb.abiturient  to 'moderator'@'localhost';
grant update ON kursovayadb.application to 'moderator'@'localhost';
grant update ON kursovayadb.certificate_zno  to 'moderator'@'localhost';
-- модератор, що може вносити дані поступаючих до таблиці абітурієнт(abiturient)
-- заява(application) абітурієнтів та результати зно (certificate_zno)

create user 'viewer'@'localhost' identified by 'viewer123';
grant select ON kursovayadb.application  to 'viewer'@'localhost';
-- глядач, що має можливість подивитися чи занесли його заяву в базу даних
-- та дізнатися свій айді в таблиці з абітурієнтами

SHOW GRANTS FOR 'moderator'@'localhost';






