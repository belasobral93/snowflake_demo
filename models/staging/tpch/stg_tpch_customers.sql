{{ config(schema='target_test') }}

with source as (

    select * from {{ source('tpch', 'customer') }}

),


renamedz as 

    select
    
        c_custkey {%- if  target.name == "test_dev" %} as new_customer_name
        {%- else %} as customer_key
        {%- endif -%},
        c_name as name,
        c_address as address, 
        c_nationkey as nation_key,
        c_phone as phone_number,
        c_acctbal as account_balance,
        c_mktsegment as market_segment,
        c_comment as comment

    from source

)

select * from renamedz

