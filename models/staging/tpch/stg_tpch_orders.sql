{{ config(schema='marketing') }}


with source as (

    select * from {{ source('tpch', 'orders') }}

),

renamed as (

    select
    
    
        o_orderpriority as priority_code,
        o_clerk as clerk_name,
        o_shippriority as ship_priority,
        o_comment as comment
    from source

),

fresher_rows as (
    select 
        12345 as order_key,
        54321 as customer_key,
        'F' as status_code,
        100 as total_price,
        CURRENT_TIMESTAMP as order_date,
        '1_URGENT' as priority_code,
        'CLERK55' as clerk_name,
        0 as ship_priority,
        'source_fresh_demo' as comment
)

select * from renamed
union all
select * from fresher_rows
order by order_date desc

