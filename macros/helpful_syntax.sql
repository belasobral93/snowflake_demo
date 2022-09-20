{%- set central_tbl -%} '{{ env_var("DBT_CLOUD_RUN_ID", "manual") }}' {%- endset -%}

{{ log(central_tbl, info = true) }}