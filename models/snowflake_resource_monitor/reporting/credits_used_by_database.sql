select database_name,
       dbt_model_name,
       dbt_job_id,
       dbt_run_id,
       dbt_environment_name,
       dbt_project_name,
       start_time,
       execution_time,
       credits_used
from   {{ref('incr_query_logs')}}
where start_time > (select dateadd(week, -1, current_date()))