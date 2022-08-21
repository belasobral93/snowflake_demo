-- this will be the "source" when analysts are building new models. it is a view on top of PII data that prevents you from seeing underlying definition
-- because we are selecting from a source this role doesn't have access to, we'll want to tag all those sources as pii, so we can run "dbt build --exclude tag:pii" in this project to avoid errors 
{{
    config(
        secure = true
    )
}}


select *, '2022-08-19T09:53:09.675000-07:00' as timestamp
from {{ source('tpch', 'customer') }} as s

