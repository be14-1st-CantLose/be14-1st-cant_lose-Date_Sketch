-- 회원 언팔로우
-- 회원 1이 회원 2를 언팔로우 한다.
DELETE
FROM follow
WHERE follower_id = 1 AND followed_id = 2;