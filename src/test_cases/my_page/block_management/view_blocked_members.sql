-- 차단 회원 조회
-- 회원 1이 차단한 회원 목록
SELECT
       a.ban_id
     , a.user_banned_id
     , b.user_name AS banned_user_name
  FROM ban a
  JOIN user b ON a.user_banned_id = b.user_id
 WHERE a.user_ban_id = 1;
