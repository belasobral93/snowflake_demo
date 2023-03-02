{{
    config(
        materialized='incremental',
        unique_key='query_id',
        incremental_strategy='delete+insert',
        on_schema_change='sync_all_columns',
        pre_hook=" {{ clone_inc_job(from_db='SA_ISABELA_1', from_schema='PRODUCTION') }} "
    )
}}

select start_time::date as dt, * 
from {{ ref('stg_query_logs') }}
{% if is_incremental() %}
where start_time > (select max(start_time) from {{this}} )
-- where start_time::date > (select max(dt) from {{this}} )
{% endif %}
order by dt desc