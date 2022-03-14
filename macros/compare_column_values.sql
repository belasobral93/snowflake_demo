{% set old_etl_relation=adapter.get_relation(
      database=target.database,
      schema="PRODUCTION",
      identifier="DIM_CUSTOMERS"
) -%}

{% set old_etl_relation_query %}
    select * from old_etl_relation
{% endset %}

{{ log(old_etl_relation_query, info = true) }}

{% set new_etl_relation_query %}
    select * from {{ ref('dim_customers') }}
{% endset %}

{% set audit_query = audit_helper.compare_column_values(
    a_query=old_etl_relation_query,
    b_query=new_etl_relation_query,
    primary_key="CUSTOMER_KEY",
    column_to_compare="PHONE_NUMBER"
) %}

{% set audit_results = run_query(audit_query) %}

{% if execute %}
{% do audit_results.print_table() %}
{% endif %}