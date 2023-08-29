
select * from {{ ref('cross_project_source', 'dim_customers') }}