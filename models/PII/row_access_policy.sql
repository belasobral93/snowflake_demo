--uses a row level masking policy to show clerk name values according to row (lookup table). 
--For my role I can only see one clerk value - if I switch roles I can see all values. 


select o_orderkey, o_orderdate, o_clerk from {{ source('dev', 'raw_source_orders') }} 