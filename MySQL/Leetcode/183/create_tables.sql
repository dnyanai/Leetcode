use leetcode;
create table customers(
 id int primary key,
name varchar(30)
);

create table orders(
id int primary key,
customerId int,
foreign key(customerId) references customers(id)  
);

