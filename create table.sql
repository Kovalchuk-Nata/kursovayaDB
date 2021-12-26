 create database kursovayadb;
use kursovayadb;

create table privilege -- пільги
(
Id INT PRIMARY KEY,
PrivilegeDescritpion varchar(400) not null
);

create table country
(
Id INT PRIMARY KEY,
CountryNames varchar(100) not null
);

create table city
(
Id INT PRIMARY KEY,
CityName varchar(100) not null,
CountryId int not null,

foreign key (CountryId) references country (Id) on delete cascade on update cascade
);

create table abiturient -- Абітурієнт
(
Id int primary key not null,
Name varchar(100) not null,
MiddleName varchar(100) not null,
Surname varchar(100) not null,
BirthDate date not null,
Passport_Id int unique not null,
Passport_Seria int unique not null,
Phone_number varchar(30) not null,
Email varchar(50) not null,
Ab_City int not null,
Adress varchar(100) not null,
School varchar(100) not null,
Graduation_date date not null,
Ab_Privilege int, 

foreign key (Ab_City) references City (Id) on delete cascade on update cascade,
foreign key (Ab_Privilege) references privilege (Id) on delete cascade on update cascade
);

create table subjects
(
Id int primary key,
SubjectName varchar(50) not null
);

create table certificate_ZNO -- сертификат ЗНО
(
Id int not null,
Abiturient_Id int not null,
SubjectId int not null,
Grade int not null,
primary key(id, SubjectId),

foreign key (Abiturient_Id) references Abiturient (Id) on delete cascade on update cascade,
foreign key (SubjectId) references Subjects (Id) on delete cascade on update cascade
);

create table form_of_education -- форма навчання (денна/заочна)
(
Id int primary key,
FOE varchar(50) not null
);

create table form_of_payment_for_education -- бюджет/контракт
(
Id int primary key,
FOPFE varchar(50) not null
);

create table EQL -- educational qualifying level або Освітньо-кваліфікаційний рівень
(
Id int primary key,
EQLName varchar(50) not null
);

create table faculty -- факультет
(
Id int primary key,
FacultyName varchar(50) not null,
Abbreviation varchar(10)
);

create table speciality -- спеціальність
(
Id int not null, -- фк может добавить SpecialityCode int not null
SpecialityName varchar(50) not null,
Faculty_Id int not null,
CompetitiveScore float not null,
primary key(id, faculty_id),

foreign key (Faculty_Id) references Faculty (Id) on delete cascade on update cascade
);

create table application -- заява
(
Id int primary key,
FacultyId int not null,
SpecialityId int not null,
AbiturientId int not null,
CertificateId int not null,
AbitCompetitiveScore float default 0,
EQLId int not null,
FOEId int not null,
FOPFE int not null,
Dormitory bool not null,

foreign key (FacultyId) references Faculty (Id) on delete cascade on update cascade,
foreign key (SpecialityId) references Speciality (Id) on delete cascade on update cascade,
foreign key (AbiturientId) references Abiturient (Id) on delete cascade on update cascade,
foreign key (CertificateId) references certificate_ZNO (Id) on delete cascade on update cascade,
foreign key (EQLId) references EQL (Id) on delete cascade on update cascade,
foreign key (FOEId) references form_of_education (Id) on delete cascade on update cascade,
foreign key (FOPFE) references form_of_payment_for_education (Id) on delete cascade on update cascade
);

