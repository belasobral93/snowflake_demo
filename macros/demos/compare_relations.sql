{% set old_etl_relation=adapter.get_relation(
      database=target.database,
      schema="PRODUCTION",
      identifier="fct_orders"
) -%}

{% set dbt_relation=ref('fct_orders') %}

{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="ORDER_KEY"
) }}

