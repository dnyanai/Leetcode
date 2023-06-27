select abs(
                   (select max(emp.salary)
                    from employee emp
                             join department dept
                                  on dept.id = emp.department_id
                    where dept.department = 'marketing')
                   -
                   (select max(emp.salary)
                    from employee emp
                             join department dept
                                  on dept.id = emp.department_id
                    where dept.department = 'engineering')) as salary_difference;



with cte as (SELECT
                 dept.department, max(emp.salary) as highest_salary
             FROM employee emp
                      JOIN department dept ON dept.id = emp.department_id
             GROUP BY dept.department)
select abs((select highest_salary
            from cte
            where department = 'marketing')
    -
           (select highest_salary
            from cte
            where department = 'engineering'))


