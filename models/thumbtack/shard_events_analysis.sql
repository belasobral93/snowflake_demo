{{ 
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
    )
  }}

SELECT * FROM {{ ref('stg_tpch_customers') }}


