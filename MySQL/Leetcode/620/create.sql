-- drop table cinema;
create table if not exists cinema (
id int primary key,
movie varchar(100),
description varchar(100),
rating float
);