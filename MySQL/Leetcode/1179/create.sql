-- drop table department; 
create table if not exists department(
id int,
revenue int,
month varchar(50),
primary key (id, month)
)