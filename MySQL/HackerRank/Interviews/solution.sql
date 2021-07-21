with 
base_id as (select coll.college_id, con.contest_id, cha.challenge_id, con.hacker_id, con.name
from contests con, colleges coll, challenges cha
where con.contest_id = coll.contest_id
and coll.college_id = cha.college_id),

view_totals as (select base_id.challenge_id, sum(vs.total_views) as total_views,
sum(vs.total_unique_views) as total_unique_views
from base_id
left join view_stats vs
on base_id.challenge_id = vs.challenge_id
group by base_id.hacker_id),

##table for getting the submission stats per contest per hacker
subs_totals as (select base_id.challenge_id, sum(subs.total_submissions) as 'total_submissions', 
sum(subs.total_accepted_submissions) as 'total_accepted_submissions'
from base_id
left join submission_stats subs
on base_id.challenge_id = subs.challenge_id
group by hacker_id
)

select base_id.contest_id, base_id.hacker_id, base_id.name, subs_totals.total_submissions, subs_totals.total_accepted_submissions,
view_totals.total_views, view_totals.total_unique_views , (subs_totals.total_submissions + subs_totals.total_accepted_submissions + 
 view_totals.total_views + view_totals.total_unique_views) as total_sum
from base_id, view_totals, subs_totals
where base_id.challenge_id = view_totals.challenge_id
and base_id.challenge_id = subs_totals.challenge_id
group by base_id.contest_id
