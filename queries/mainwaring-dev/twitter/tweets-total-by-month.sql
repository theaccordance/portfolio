with data as (
  select
    date_trunc('month', timestamp) as month,
    count(1)
  from public.tweets
  group by 1
)

select
  month,
  sum(count) over (order by month asc rows between unbounded preceding and current row)
from data
