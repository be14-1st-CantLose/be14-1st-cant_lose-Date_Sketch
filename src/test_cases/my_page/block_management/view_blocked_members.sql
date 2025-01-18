-- 차단 회원 조회
-- 회원 1이 차단한 회원 목록
SELECT b.ban_id, u.user_name AS banned_user_name
FROM ban b
         JOIN user u ON b.user_banned_id = u.user_id
WHERE b.user_ban_id = 1;