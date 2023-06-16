{{ config(schema='DEVELOPMENT',materialized='table') }}
with delta as (

    select * from {{ source('tpch', 'orders') }}

)

select * from delta