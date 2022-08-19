--uses a column masking policy to hide c_name values depending on role. 
---------------------------------------
-- sql:
    --create or replace masking policy name_mask as (val string) returns string ->
    --   case
    --     when is_role_in_session('TRANSFORMER') then val
    --     else '*********'
    --   end

    -- alter table raw_source_customers modify column c_name set masking policy name_mask;
---------------------------------------


select * from {{ source('dev', 'raw_source_customers') }}


