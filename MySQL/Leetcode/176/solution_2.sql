select (select distinct salary 
from employee  
order by Salary DESC 
limit 1 offset 1) as SecondHighestSalary
