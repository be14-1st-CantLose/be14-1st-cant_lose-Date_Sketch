 -- 별점 별로 장소를 검색
SELECT
       place_name
     , addr_gu
     , addr_detail
     , phone_number
     , homepage
     , operation_hours
     , link
     , is_verified
     , rating_avg
  FROM place
 WHERE rating_avg >= 3.0;