select concat(name,concat('(',substr(upper(occupation),1,1),')')) as occ from occupations order by name;

select 'There are a total of ' as '1',count(occupation) as '2',concat(lower(occupation),'s.') as '3' 
from occupations
group by occupation
order by count(occupation) ASC;
