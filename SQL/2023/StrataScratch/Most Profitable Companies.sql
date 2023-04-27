--https://platform.stratascratch.com/coding/10354-most-profitable-companies?code_type=1
--explain(analyze, verbose)
select t.company, t.profits profit
                          from (
                                   select
                                       fg.company,
                                       fg.profits,
                                       rank() over (order by profits desc) top_profitable
                                   from forbes_global_2010_2014 fg) t
                          where
                                  top_profitable <=3;