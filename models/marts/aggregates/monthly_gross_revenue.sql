with fct_order_items as (
    select * from {{ ref('fct_order_items') }}
)

select
    date_trunc(month, fct_order_items.order_date) as order_month,sum(fct_order_items.gross_item_sales_amount) as gross_revenue
from fct_order_items
group by 1 order by 1 asc