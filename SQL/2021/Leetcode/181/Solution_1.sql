-- select * from employee;

select t1.name as 'Employee' from employee t1, employee t2
where t1.ManagerId = t2.id and  t1.Salary > t2.Salary
