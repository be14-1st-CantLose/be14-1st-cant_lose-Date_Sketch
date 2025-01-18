-- 팔로우 요청 수락
-- 비공개 회원이 팔로우를 수락한다.
-- 회원 2가 회원 1의 팔로우 요청을 수락한다.
UPDATE follow
SET is_acceptance = TRUE
WHERE follower_id = 1 AND followed_id = 2;