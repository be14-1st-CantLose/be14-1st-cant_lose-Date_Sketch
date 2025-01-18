-- 팔로잉 조회
-- 회원 3이 팔로우중인 회원 목록
SELECT f.follow_id, f.follower_id, f.followed_id, u.user_name AS followed_name
FROM follow f
         JOIN user u ON f.followed_id = u.user_id
WHERE f.follower_id = 3 AND f.is_acceptance = TRUE;