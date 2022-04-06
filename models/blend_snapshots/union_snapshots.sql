with snowflake_snapshot as (
    select *, 'snowflake' as warehouse
    from {{ref('snowflake_orders_snapshot')}}
    where O_ORDERKEY = 1 OR O_ORDERKEY = 2
),
redshift_snapshot as (
    select *, 'redshift' as warehouse
    from {{ref('orders_snapshot')}}
    where O_ORDERKEY = 1 OR O_ORDERKEY = 2
),

unioned as (
    select * from snowflake_snapshot
    UNION
    select * from redshift_snapshot
),

unioned_ordered as (
    select * from unioned order by O_ORDERKEY,DBT_VALID_FROM
),

fill_in_date_gapz as (
    select *,
	LEAD(DBT_VALID_FROM, 1) OVER (
        PARTITION BY O_ORDERKEY
		order by DBT_VALID_FROM
	) as next_date
    from unioned
)

select *
from fill_in_date_gapz







