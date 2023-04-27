create view q_175 as 
select p1.firstname,p1.lastname,p2.city,p2.state from persons p1
left join address p2 on p1.personId = p2.personId