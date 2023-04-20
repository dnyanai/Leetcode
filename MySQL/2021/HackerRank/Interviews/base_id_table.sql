with cte as 
(select coll.college_id, con.contest_id, cha.challenge_id, con.hacker_id, con.name
from contests con
join colleges coll
on con.contest_id = coll.contest_id
join challenges cha
on coll.college_id = cha.college_id)

select * from cte;
