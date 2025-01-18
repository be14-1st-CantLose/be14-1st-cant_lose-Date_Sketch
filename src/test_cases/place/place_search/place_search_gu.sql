USE test;

-- 지역별로 장소 검색(addr_gu)
SELECT
       place_name
     , addr_gu
     , addr_detail
  FROM place
 WHERE addr_gu = '서울특별시 종로구';