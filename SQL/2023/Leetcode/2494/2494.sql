




WITH recursive cte AS
(
         SELECT   *,
                  row_number() OVER (partition BY hall_id ORDER BY start_day) AS rn
         FROM     hallevents), a AS
(
       SELECT hall_id,
              start_day,
              end_day,
              rn
       FROM   cte
       WHERE  rn = 1
       UNION ALL
       SELECT cte.hall_id, (
              CASE
                     WHEN cte.start_day <= a.end_day THEN a.start_day
                     ELSE cte.start_day
              END) start_day, (
              CASE
                     WHEN cte.end_day >= a.end_day THEN cte.end_day
                     ELSE a.end_day
              END) end_day,
              cte.rn
       FROM   cte
       JOIN   a
       ON     cte.rwith recursive cte AS
              (
                       SELECT   *,
                                row_number() OVER (partition BY hall_id ORDER BY start_day) AS rn
                       FROM     hallevents),
              a AS
              (
                     SELECT hall_id,
                            start_day,
                            end_day,
                            rn
                     FROM   cte
                     WHERE  rn = 1
                     UNION ALL
                     SELECT cte.hall_id, (
                            CASE
                                   WHEN cte.start_day <= a.end_day THEN a.start_day
                                   ELSE cte.start_day
                            END) start_day, (
                            CASE
                                   WHEN cte.end_day >= a.end_day THEN cte.end_day
                                   ELSE a.end_day
                            END) end_day,
                            cte.rn
                     FROM   cte
                     JOIN   a
                     ON     cte.rn = a.rn + 1
                     AND    cte.hall_id = a.hall_id)
       SELECT   hall_id,
                start_day,
                max(end_day) end_day
       FROM     a
       GROUP BY hall_id,
                start_day.n = a.rn + 1
       AND      cte.hall_id = a.hall_id)
SELECT   hall_id,
         start_day,
         max(end_day) end_day
FROM     a
GROUP BY hall_id,
         start_day.