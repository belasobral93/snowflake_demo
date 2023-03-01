SHOW PARAMETERS;

SELECT * FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));

{{ dbt.type_timestamp() }}


-- default timestamp is NTZ, but it is set at the user level. So whatever service account timezone you set, thats what it'll output
-- but you can change that default in Snowflake.

