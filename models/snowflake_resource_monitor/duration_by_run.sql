select dbt_run_id, sum(total_elapsed_time) as total_run_duration
from {{ ref('inc_query_logs') }}
where dbt_run_id not in ('not_set', 'not set')
group by 1
order by dbt_run_id desc