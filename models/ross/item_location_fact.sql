select a.item,
       a.loc,
       nvl(a.cumm_sales,0.0) cumm_sales,
       nvl(a.stock_on_hand,0.0) stock_onhand,
       nvl(a.in_transit_qty,0.0) in_transit_qty,
       nvl(b.inv_adj,0.0) inv_adj,
       a.loc_type,
       a.loc_name
  from {{ ref('temp_item_loc_soh_sales') }} a
  left join {{ ref('temp_tran_data_history') }} b
    on a.item = b.item
   and a.loc = b.loc
 where (nvl(a.cumm_sales,0.0) <> 0.0
    or nvl(a.stock_on_hand,0.0) <> 0.0
    or nvl(a.in_transit_qty,0.0) <> 0.0
    or nvl(b.inv_adj,0.0) <> 0.0)
 order by a.item;