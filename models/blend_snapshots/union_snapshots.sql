-----DATESPINE
-- with redshift_snapshot as (
--     select *
--     from {{ref('orders_snapshot')}}
--     where O_ORDERKEY = 1
-- ),

-- date_spine as (
--     select * from {{ ref('date_spine') }}
-- )

-- select * 
-- from date_spine d
-- full outer join redshift_snapshot s on s.DBT_UPDATED_AT = d.DATE_DAY
-----
---- SNOWFLAKE_UNION 2 order keys
-- with snowflake_snapshot as (
--     select *, 'snowflake' as warehouse
--     from {{ref('snowflake_orders_snapshot')}}
--     where O_ORDERKEY = 1 OR O_ORDERKEY = 2
-- ),
-- redshift_snapshot as (
--     select *, 'redshift' as warehouse
--     from {{ref('orders_snapshot')}}
--     where O_ORDERKEY = 1 OR O_ORDERKEY = 2
-- ),

-- unioned as (
--     select * from snowflake_snapshot
--     UNION
--     select * from redshift_snapshot
-- )

-- select * from unioned order by O_ORDERKEY,DBT_VALID_FROM
--------
---- SNOWFLAKE_UNION 1 order key

with snowflake_snapshot as (
    select *, 'snowflake' as warehouse
    from {{ref('snowflake_orders_snapshot')}}
    where O_ORDERKEY = 1 
),
redshift_snapshot as (
    select *, 'redshift' as warehouse
    from {{ref('orders_snapshot')}}
    where O_ORDERKEY = 1 
),

unioned as (
    select * from snowflake_snapshot
    UNION
    select * from redshift_snapshot
),

unioned_ordered as (
    select * from unioned order by DBT_VALID_FROM
),

fill_in_date_gaps as (
    select *,
	LEAD(DBT_VALID_FROM, 1) OVER (
		order by DBT_VALID_FROM
	) as next_date
    from unioned_ordered
)

select *
from fill_in_date_gaps







