{% macro shard_events_analysis() %}

{{
  config_incremental()
}}

SELECT * from {{ ref('fct_orders') }}

{% endmacro %}