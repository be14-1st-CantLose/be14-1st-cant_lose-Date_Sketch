USE test;

-- 장소 검색(장소 이름)
SELECT
       place_name
     , addr_gu
     , addr_detail
  FROM place
 WHERE place_name LIKE '교보문고%';
-- 장소 검색(주소 상세)
SELECT
       place_name
     , addr_gu
     , addr_detail
  FROM place
 WHERE addr_detail LIKE '교보생명빌딩%';

-- 나누어서 검색?
SELECT
       place_name
     , addr_gu
     , addr_detail
  FROM place
 WHERE place_name LIKE '교보문고%'
   AND addr_gu = '서울특별시 종로구';