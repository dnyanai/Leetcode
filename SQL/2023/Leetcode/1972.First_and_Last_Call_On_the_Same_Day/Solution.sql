with get_all_user_calls as (
                            select
                                call_time::date,
                                caller_id as user_id,
                                max(call_time) over(partition by caller_id, call_time::date) as last_call,
                                min(call_time) over(partition by caller_id, call_time::date) as first_call
                            from Calls
                            union all
                            select
                                call_time::date,
                                recipient_id as user_id,
                                max(call_time) over(partition by recipient_id, call_time::date) as last_call,
                                min(call_time) over(partition by recipient_id, call_time::date) as first_call
                            from Calls
                            )
select * from get_all_user_calls;
select distinct user_id, last_call, first_call
from get_all_user_calls
where

WITH first_last_call AS (
  SELECT user_id, MIN(call_time) AS first_call, MAX(call_time) AS last_call
  FROM (
    SELECT caller_id AS user_id, call_time
    FROM Calls
    UNION ALL
    SELECT recipient_id AS user_id, call_time
    FROM Calls
  ) a
  GROUP BY user_id, date(call_time)
)
SELECT user_id
FROM first_last_call
WHERE date(first_call) = date(last_call) AND
        (SELECT COUNT(DISTINCT recipient_id) FROM Calls WHERE caller_id = user_id AND date(call_time) = date(first_call)) = 1






