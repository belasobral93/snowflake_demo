-- select a.item,
--        b.loc,
--        d.loc_name,
--        b.loc_type,
--        b.stock_on_hand,
--        b.in_transit_qty,
--        c.cumm_sales
--   from {{ source('rdl_ref_zone', 'item_master__v') }} a
--   join {{ source('rdl_ref_zone', 'item_loc_soh__v') }} b
--     on a.item = b.item
--    and a.item_level = a.tran_level
--    and a.status = 'A'
--   left join {{ source('rdl_ref_zone', 'ros_impact_data__v') }} c
--     on b.item = c.item
--    and b.loc = c.store
--   left join {{ ref('temp_loc_list') }} d
--     on b.loc = d.loc;


