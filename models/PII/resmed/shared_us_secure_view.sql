{{
    config(
        secure=true
    )
}}


select *, '2022-08-19T09:53:09.675000-07:00' as timestamp
from {{ source('resmed', 'source_secure_customers') }} as s