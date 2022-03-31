{% snapshot snowflake_orders_snapshot %}

{{
    config(
      target_database='SA_ISABELA_1',
      target_schema='SNAPSHOTS',
      unique_key='o_orderkey',

      strategy='timestamp',
      updated_at='o_orderdate',
    )
}}

select * from {{ ref('tpch', 'snowflake_orders') }}

{% endsnapshot %}