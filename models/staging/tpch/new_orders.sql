{{ config(materialized='table') }}
with sources as (

    select * from {{ source('tpch', 'orders') }}

)

select * from sources