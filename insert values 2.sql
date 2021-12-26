select * from abiturient;
select * from application;
select * from certificate_zno;
select * from city;
select * from country;
select * from eql;
select * from faculty;
select * from form_of_education;
select * from form_of_payment_for_education;
select * from privilege;
select * from speciality;
select * from subjects;

/* -- зно предметы

insert certificate_zno()
values
(1, 1, 12, 198),
(1, 1, 1, 199),
(1, 1, 4, 194),
(2, 2, 12, 200),
(2, 2, 2, 189),
(2, 2, 4, 194),
(3, 3, 1, 190),
(3, 3, 13, 189),
(3, 3, 4, 175),
(4, 4, 13, 200),
(4, 4, 1, 189),
(4, 4, 3, 194),
(5, 5, 12, 180),
(5, 5, 2, 187),
(5, 5, 4, 174),
(6, 6, 13, 183),
(6, 6, 4, 179),
(6, 6, 1, 159),
(7, 7, 4, 184),
(7, 7, 2, 200),
(7, 7, 13, 181),
(8, 8, 4, 169),
(8, 8, 1, 157),
(8, 8, 13, 170),
(9, 9, 12, 156),
(9, 9, 3, 154),
(9, 9, 1, 178),
(10, 10, 4, 179),
(10, 10, 1, 169),
(10, 10, 13, 156),
(11, 11, 12, 179),
(11, 11, 1, 196),
(11, 11, 4, 156),
(12, 12, 13, 189),
(12, 12, 2, 199),
(12, 12, 3, 178),
(13, 13, 4, 179),
(13, 13, 2, 189),
(13, 13, 13, 173),
(14, 14, 4, 173),
(14, 14, 1, 171),
(14, 14, 13, 167),
(15, 15, 12, 200),
(15, 15, 2, 200),
(15, 15, 3, 199),
(16, 16, 4, 179),
(16, 16, 2, 196),
(16, 16, 13, 200);

insert certificate_zno()
values
(17, 17, 4, 169),
(17, 17, 2, 189),
(17, 17, 13, 174),
(18, 18, 4, 174),
(18, 18, 1, 172),
(18, 18, 13, 200),
(19, 19, 12, 200),
(19, 19, 2, 198),
(19, 19, 3, 199),
(20, 20, 4, 189),
(20, 20, 2, 186),
(20, 20, 13, 190);

insert certificate_zno()
values
(21, 21, 12, 178),
(21, 21, 1, 196),
(21, 21, 4, 200),
(22, 22, 13, 188),
(22, 22, 2, 199),
(22, 22, 3, 177),
(23, 23, 4, 179),
(23, 23, 2, 189),
(23, 23, 13, 174),
(24, 24, 4, 173),
(24, 24, 1, 171),
(24, 24, 13, 169),
(25, 25, 12, 200),
(25, 25, 2, 200),
(25, 25, 3, 199),
(26, 26, 4, 179),
(26, 26, 2, 196),
(26, 26, 13, 200),
(27, 27, 13, 188),
(27, 27, 2, 199),
(27, 27, 3, 177),
(28, 28, 4, 179),
(28, 28, 2, 189),
(28, 28, 13, 174);
*/


insert application()
values
(1, 2, 113, 1, 1, 0, 1, 1, 3, 0),
(2, 1, 126, 2, 2, 0, 1, 2, 3, 1),
(3, 2, 113, 3, 3, 0, 1, 1, 3, 1),
(4, 1, 121, 4, 4, 0, 1, 1, 3, 0),
(5, 4, 113, 5, 5, 0, 2, 1, 1, 1),
(6, 1, 121, 6, 6, 0, 1, 1, 3, 0),
(7, 2, 113, 7, 7, 0, 1, 1, 3, 1),
(8, 1, 121, 8, 8, 0, 1, 2, 3, 1),
(9, 4, 113, 9, 9, 0, 1, 1, 1, 1),
(10, 2, 121, 10, 10, 0, 1, 1, 3, 0),
(11, 4, 125, 11, 11, 0, 1, 1, 3, 0),
(12, 4, 113, 12, 12, 0, 1, 1, 3, 1),
(13, 1, 121, 13, 13, 0, 2, 2, 1, 0),
(14, 3, 122, 14, 14, 0, 1, 1, 3, 1);

insert application()
values
(15, 1, 126, 15, 15, 0, 1, 1, 2, 1),
(16, 1, 121, 16, 16, 0, 1, 1, 3, 0),
(17, 2, 113, 17, 17, 0, 1, 2, 2, 0),
(18, 4, 125, 18, 18, 0, 1, 1, 3, 1),
(19, 1, 123, 19, 19, 0, 1, 1, 3, 0),
(20, 2, 121, 20, 20, 0, 2, 1, 2, 1),
(21, 3, 124, 21, 21, 0, 1, 1, 3, 0),
(22, 2, 121, 22, 22, 0, 1, 1, 3, 1),
(23, 2, 113, 23, 23, 0, 1, 1, 3, 0),
(24, 3, 124, 24, 24, 0, 1, 2, 2, 1),
(25, 3, 122, 25, 25, 0, 1, 1, 3, 1),
(26, 4, 113, 26, 26, 0, 1, 1, 3, 1),
(27, 1, 121, 27, 27, 0, 1, 2, 2, 0),
(28, 2, 113, 28, 28, 0, 2, 1, 3, 1);