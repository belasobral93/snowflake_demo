{#
    Renders a schema name given a custom schema name. In production, this macro
    will render out the overriden schema name for a model. Otherwise, the default
    schema specified in the active target is used.

    Arguments:
    custom_schema_name: The custom schema name specified for a model, or none
    node: The node the schema is being generated for a

#}
{% macro generate_schema_name_for_all_env(custom_schema_name, node) -%}
    {% for cust_id in var("cust_id") %}

        {%- set default_schema = target.schema -%}
        {%- if (target.name == 'prod' or target.name == 'ls') -%}

            {{ default_schema }}_{{ var("cust_id") }}

        {%- else -%}

            {{ default_schema }}

        {%- endif -%}
    {% endfor %}

{%- endmacro %}