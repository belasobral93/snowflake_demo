-- #Incremental model to preserve history of yearly revenue. We will apply a uniqueness test to the year column on this model, so that if the 
-- #total_revenue changes for a year, a new row will be inserted into this model, therefore failing the uniqueness test on year.

{{ config(
    materialized="incremental", 
    unique_key=['year','total_revenue']) }}

select year, total_revenue
from {{ ref("data_source_revenue") }}

{% if is_incremental() %} where true {% endif %}