-- 팔로워 조회
-- 회원 4를 팔로우하는 팔로워 목록
SELECT f.follow_id, f.followed_id, f.follower_id, u.user_name AS follower_name
FROM follow f
         JOIN user u ON f.follower_id = u.user_id
WHERE f.followed_id = 4 AND f.is_acceptance = TRUE;