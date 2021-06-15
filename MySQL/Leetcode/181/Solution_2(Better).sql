select t1.name as 'Employee' from employee t1
inner join employee t2 on t1.managerId = t2.id 
where t1.salary > t2.salary
