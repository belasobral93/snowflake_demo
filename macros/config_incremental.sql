{%- macro config_incremental() -%}
  
  {{ 
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        post_hook = {
        "sql": "SELECT 1"
      }
    )
  }}

{%- endmacro -%}