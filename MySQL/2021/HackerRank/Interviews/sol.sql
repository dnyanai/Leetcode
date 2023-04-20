/* we want to get the contest and college id information, for this i will do an inner join between contests and colleges tables, 
on observing I see that all the quantitative attributes are taken from view_stats and submission_stats table. 
these tables have challenge_id as their identifier, to connect our above inner joined table, lets call it contact_info_table, 
to these tables we see the challenge_id as a common field. 

But, we get the contact information, for calculating the quantitative attributes, i can just use the View_stats table and get the sum per challenge_id, 
similarly ill do this for the submission_stats table. 
Once I get the quantitative attrs per challenge_id. 

I do a join between contact_info_table and these two measures from each view_stats table and submissions_stats table. 

Other conditions -> 
1) the sum of all the measures should be more than 0. 
2) if we look at the sample output, angela has 0 for total_submissions, so it could be a null to 0 conversion for this row value since we
 will not find angela in the submission stats table at all. 
3) Challenges_id has some ids or questions which are not associated with any colleges, like for 75516. So, we cannot take an inner join while
 dealing with the contact_info_table and view_stats_table

Okay... lets start
*/ 

/* First, lets make the contact_info_table */

with contact_tble as (
select con.contest_id, con.hacker_id, 
coll.college_id, cha.challenge_id, con.name 
from contests con, colleges coll, challenges cha
where con.contest_id = coll.contest_id
and coll.college_id = cha.college_id),

/* Output of this: 
contest_id hacker_id college_id challenge_id  name
66406       17973       11219   18765        Rose
66406       17973       11219   90000        Rose

*/

view_totals as(
select challenge_id, 
sum(total_views) as 'total_views',    
sum(total_unique_views) as 'total_unique_views'
    from view_stats
    group by challenge_id),
  
subs_totals as (
select challenge_id, 
sum(total_submissions) as 'total_submissions',
sum(total_Accepted_submissions) as 'total_accepted_submissions'
    from submission_stats
    group by challenge_id)

/* So the tables we creates above are :
1) contact_tble 
2) View_totals
3) Subs_totals */

select c.contest_id, c.hacker_id, c.name,
case when sum(s.total_submissions) is null then 0 else sum(s.total_submissions) end as total_submissions,
case when sum(s.total_accepted_submissions) is null then 0 else sum(s.total_accepted_submissions) end as total_accepted_submissions, 
case when sum(v.total_views) is null then 0 else sum(v.total_views) end as total_views, 
case when sum(v.total_unique_views) is null then 0 else sum(v.total_unique_views) end as total_unique_views 
from contact_tble c
left join View_totals v
on c.challenge_id = v.challenge_id
left join subs_totals s
on v.challenge_id = s.challenge_id
group by c.contest_id, c.hacker_id, c.name
having total_submissions + total_accepted_submissions + total_views + total_unique_views > 0
order by c.contest_id;