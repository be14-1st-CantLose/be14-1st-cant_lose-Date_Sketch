SELECT
       a.saved_id
     , a.category_id
     , b.place_id
     , b.place_name
     , b.addr_gu
     , b.addr_detail
     , b.phone_number
     , b.homepage
     , b.operation_hours
     , b.link
     , b.is_verified
     , b.rating_avg
     , b.rating_count
  FROM save a
  JOIN place b ON a.place_id = b.place_id
 WHERE a.user_id = 2
   AND a.save_type = 'PLACE';