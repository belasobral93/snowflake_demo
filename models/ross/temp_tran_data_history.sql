select Z.item,
       Z.loc,
       sum(Z.units) inv_adj
 from (SELECT A.item,
              case when store = -1 then wh else store end loc,
              units
         FROM  {{ source('rdl_ref_zone', 'tran_data_history') }} a,
              {{ source('rdl_ref_zone', 'item_master__v') }} b
        WHERE a.item = b.item
          and b.item_level = 2
          and b.status = 'A'
          and a.header_timestamp >= CAST('2001-01-01 00:00:00' AS TIMESTAMP)
          AND a.tran_code IN (22,41)
       UNION ALL
       SELECT C.item,
              case when store = -1 then wh else store end loc,
              units
         FROM {{ source('rdl_ref_zone', 'tran_data_history__ct') }} c,
              {{ source('rdl_ref_zone', 'item_master__v') }} d
        WHERE c.item = d.item
          and d.item_level = 2
          and d.status = 'A'
          and d.header_timestamp >= CAST('2001-01-01 00:00:00' AS TIMESTAMP)
          AND C.tran_code IN (22,41)) z
 group by item, loc;
 
