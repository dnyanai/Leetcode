Create table If Not Exists HallEvents (hall_id int, start_day date, end_day date)
Truncate table HallEvents
insert into HallEvents (hall_id, start_day, end_day) values ('1', '2023-01-13', '2023-01-14')
insert into HallEvents (hall_id, start_day, end_day) values ('1', '2023-01-14', '2023-01-17')
insert into HallEvents (hall_id, start_day, end_day) values ('1', '2023-01-18', '2023-01-25')
insert into HallEvents (hall_id, start_day, end_day) values ('2', '2022-12-09', '2022-12-23')
insert into HallEvents (hall_id, start_day, end_day) values ('2', '2022-12-13', '2022-12-17')
insert into HallEvents (hall_id, start_day, end_day) values ('3', '2022-12-01', '2023-01-30')