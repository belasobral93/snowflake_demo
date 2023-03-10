-- #In this example we have a history of total revenue per year. 
-- #We want to ensure the revenue value each year does not change, otherwise that indicates a breaking change was introduced.

select
        year(order_date) as year,
        sum(return_count) as total_revenue
from {{ ref('fct_orders') }}
where year <> year(current_timestamp())
group by 1