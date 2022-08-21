--example: uses a row level masking policy to show clerk name values according to row (lookup table).  


select o_orderkey, o_orderdate, o_clerk from {{ source('pii', 'raw_source_orders') }} 