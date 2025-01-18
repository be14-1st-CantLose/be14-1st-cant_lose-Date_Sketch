USE test;

-- 별점을 매긴 사용자가 로그인 한 상태에서
-- 해당 장소에 대한 별점 업데이트
UPDATE rating
   SET rating_score = 2
 WHERE user_id = 3
   AND place_id = 1;