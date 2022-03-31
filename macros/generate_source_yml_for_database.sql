{# run this with: dbt run-operation check_if_schema_exists #}
{# next steps for iteration: add this to a post-hook and test in production (https://docs.getdbt.com/reference/resource-configs/pre-hook-post-hook) #}

{% macro generate_source_yml_for_database(db='RAW', generate_cols=True) %}
    {# read schemas from database. #}
    {% set schemas = run_query("select schema_name from " ~ db ~ ".information_schema.schemata where schema_name != 'INFORMATION_SCHEMA'").columns[0].values() %}

    {# loop through schemas and put into a list #}
    {% set myList = [] %}
    {% for schema in schemas %}
        {% do log(schema, true) %}
        {% do myList.append(schema) %}
        {% do log(myList, true) %}
    {% endfor %}

    {# raise compiler error if current schema is not in list #}
    {% if schema not in myList %}   
        {{ exceptions.raise_compiler_error("schema does not exist. Schema name is " + schema) }}   
    {% endif %} 

{% endmacro %}