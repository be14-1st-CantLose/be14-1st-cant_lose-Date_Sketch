-- 저장한 장소 확인
-- 회원 2가 저장한 장소 목록
SELECT a.saved_id
     , a.user_id
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
     , c.saved_category_name
  FROM save a
  JOIN place b ON a.place_id = b.place_id
  JOIN save_category c ON a.category_id = c.saved_category_id
 WHERE a.user_id = 2 AND a.save_type = 'PLACE';