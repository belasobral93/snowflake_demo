-- an additional layer of security in addition to RLS and CLS where the view definition and details are visible only to authorized users (going into snowflake and 
-- changing the role will prevent me from seeing the view definition) 
-- there can be performance considerations though
-- this will be the "source" 
-- because we are selecting from a source this role doesn't have access to, we'll want to tag all those sources as pii, so we can run "dbt build --exclude tag:pii" in this project to avoid errors 
{{
    config(
        secure = true
    )
}}


select *, '2022-08-19T09:53:09.675000-07:00' as timestamp
from {{ source('tpch', 'customer') }} as s

