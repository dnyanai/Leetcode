select 
ifnull((select distinct Salary from employee order by Salary desc limit 1 offset 1),Null) as SecondHighestSalary