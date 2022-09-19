{{ config(store_failures = true) }}

select * from {{ ref('duration_by_run') }} where total_run_duration > {{ var('run_duration_limit') }}
