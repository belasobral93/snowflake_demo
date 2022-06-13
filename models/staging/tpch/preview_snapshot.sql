select * 
from {{ ref('snowflake_orders_snapshot') }}
where O_ORDERKEY = 3 