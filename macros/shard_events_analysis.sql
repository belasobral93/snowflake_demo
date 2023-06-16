{% macro shard_events_analysis() %}

{{
  config_incremental()
}}

SELECT * FROM {{ ref('stg_tpch_customers') }}

{% endmacro %}

