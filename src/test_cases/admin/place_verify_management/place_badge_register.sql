USE test;
# 장소 뱃지 등록(관리자)
UPDATE place
   SET is_verified = 'YES'
 WHERE place_id = 5;
