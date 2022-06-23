{% macro create_qa_database() -%}

    {%- if target.name == 'qa' -%}

       create database QA_{{env_var('DBT_ENV')}};

    {%- endif -%}

{%- endmacro %}

