



{#
-- {{ codegen.generate_model_yaml(
--     model_name='stg_tpch_customers'
-- ) }}

-- {{ codegen.generate_base_model(
--     source_name='tpch',
--     table_name='orders',
--     leading_commas = false
-- ) }}
#}

{{ codegen.generate_source(
    schema_name = 'tpch',
    generate_columns = true
) }}









