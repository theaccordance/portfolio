with data as (
  select
    date_trunc('month', start) as month,
    count(1)
  from public.workouts
  group by 1
)

select
  month,
  sum(count) over (order by month asc rows between unbounded preceding and current row)
from data
