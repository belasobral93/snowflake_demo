{%- macro config_incremental() -%}
  
  {{ 
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
    )
  }}

{%- endmacro -%}