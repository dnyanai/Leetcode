# Please write a SQL query to output movies with an odd numbered ID and 
# a description that is not 'boring'. Order the result by rating.
select id,description
from cinema
where id%2 != 0 and description != 'boring'
order by rating
