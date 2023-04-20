use hackerrank;

select c.contest_id,c.hacker_id,c.name,SUM(s.total_submissions),SUM(s.total_submissions),SUM(s.total_accepted_submissions),
SUM(v.total_views),SUM(v.total_unique_views)
from contests as c, submission_stats as s, view_stats as v

