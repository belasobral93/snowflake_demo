select * 
from {{ ref('snowflake_orders_snapshot') }}
where DBT_VALID_TO IS NOT NULL