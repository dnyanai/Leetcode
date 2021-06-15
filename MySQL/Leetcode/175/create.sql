-- drop table address;
create table if not exists persons(
personId int primary key,
firstName varchar(100),
lastName varchar(100)
);

create table if not exists address(
addressId int,
personId int,
foreign key (personId) references persons(personId),
city varchar(50),
state varchar(50)
);

