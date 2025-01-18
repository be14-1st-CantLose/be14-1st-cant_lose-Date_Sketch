USE test;

-- 장소 삭제
DELETE
  FROM place
 WHERE place_id = 1;

-- 삭제 확인
SELECT
       *
  FROM place;