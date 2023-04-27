with source as (

    select * from {{ source('tpch', 'nation') }}

),

renamed as (

    select
    
        n_nationkey as nation_keys,
        n_regionkey as region_key,
        n_comment as comment

    from source

)

select * from renamed