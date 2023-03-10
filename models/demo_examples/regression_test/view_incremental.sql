-- #how to view the contents of an incremental table. Be sure to have run dbt run on the incremental model (ex: incremental_revenue) so you can see the contents.

select * from {{ ref('incremental_revenue') }}