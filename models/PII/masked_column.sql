--uses a column masking policy to hide c_name values depending on role. 


select * from {{ source('pii', 'raw_source_customers') }}


