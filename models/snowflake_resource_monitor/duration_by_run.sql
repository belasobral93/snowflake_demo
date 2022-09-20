select dbt_run_id, sum(total_elapsed_time) as total_run_durationz
from {{ ref('inc_query_logs') }}
where dbt_run_id = '{{ env_var("DBT_CLOUD_RUN_ID", "manual") }}'
group by 1
order by dbt_run_id desc

{{ log("RUN ID IS " + '{{ env_var("DBT_CLOUD_RUN_ID"}}', info = true) }}
