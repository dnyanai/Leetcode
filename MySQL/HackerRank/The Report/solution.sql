(select t.name, t.grade, t.marks  
from (select * 
from students 
cross join grades 
where grades.grade >= 8 order by students.name ASC) t 
where t.marks between t.min_mark and t.max_mark+1
order by t.marks DESC)
