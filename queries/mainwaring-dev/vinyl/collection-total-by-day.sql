with data as (
  select
    date_trunc('day', created_at) as day,
    count(1)
  from public.vinyls
  group by 1
)

select
  day,
  sum(count) over (order by day asc rows between unbounded preceding and current row)
from data
