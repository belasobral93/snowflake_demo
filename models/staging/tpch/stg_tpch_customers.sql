{{ config(schema='target_test') }}

with source as (

    select * from {{ source('tpch', 'customer') }}

),


renamed as (

    select
    
        c_custkey {%- if  target.name == "test_dev" %} as new_customer_name
        {%- else %} as customer_key
        {%- endif -%},
        c_name as name,
        c_address as address, 
        c_nationkey as nation_key,
        c_phone as phone_number,
        c_acctbal as account_balance,
        c_mktsegment as market_segment,
        c_comment as comment

    from source

)

select * from renamed

{% do log("this is schema  "+schema, info=true) %}
{% do log("this is target.schema "+ target.schema, info=true) %}

{% macro generate_source_yml_for_database(db='RAW', generate_cols=True) %}

    {# Get schemas (technically, schemata is the plural of schema - but I am a rebel) #}
    {% set schemas = run_query("select schema_name from " ~ db ~ ".information_schema.schemata where schema_name != 'INFORMATION_SCHEMA'").columns[0].values() %}

    {# Generate source yaml for each database. There are duplicate version entries for now but I would like to fix this in the future. For now, just buck up and clean the text by hand #}
    {% for schema in schemas %}
        {{ codegen.generate_source(schema_name=schema, database_name=db, generate_columns=generate_cols) }}
        {% do log('\n---\n\n', true) %}
    {% endfor %}

{% endmacro %}

