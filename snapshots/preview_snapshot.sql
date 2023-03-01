select * 
from {{ ref('snowflake_orders_snapshot') }}
where o_orderkey = 1