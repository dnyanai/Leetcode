drop schema the_report;
create schema the_report;
use the_report;

drop table students;
drop table grades;

create table if not exists students(
id int primary key,
name varchar(140),
marks int
);

create table if not exists grades(
grade int primary key, 
min_mark int, 
max_mark int
);

insert into students (id, name, marks) values (1, 'Julia', 88), (2,'Samantha', 68), (3,'Maria', 99), (4, 'Scarlet', 78), (5, 'Ashley', 63), (6, 'Jane', 81);
insert into grades (grade, min_marks, max_marks) values (1, 0 ,9), (2, 10, 19), (3, 20, 29), (4, 30, 39), (5, 40, 49), (6, 50, 59), (7, 60, 69), (8, 70, 79),
(9, 80, 89), (10, 90, 100);