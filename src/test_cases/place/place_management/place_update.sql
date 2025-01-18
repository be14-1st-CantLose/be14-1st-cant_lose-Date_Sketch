USE test;
-- 장소 정보 수정
UPDATE place
   SET place_name = '오튀그 안국'
     , addr_detail = '서울특별시 종로구 재동 83-5'
     , operation_hours = '10:00~19:00'
     , homepage = 'https://github.com/rainyday1367'
 WHERE place_id = 1;

-- 수정되었는지 확인
SELECT
       *
  FROM place
 WHERE place_id = 1;
