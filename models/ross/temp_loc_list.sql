-- select store loc,
--        store_name loc_name 
--   from {{ source('rdl_ref_zone', 'store__v') }}
-- union all
-- select wh loc,
--        wh_name loc_name
--  from  {{ source('rdl_ref_zone', 'wh__v') }};

