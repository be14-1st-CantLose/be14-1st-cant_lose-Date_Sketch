-- 팔로우 요청 거절
-- 비공개 회원이 팔로우를 거절하여 팔로우 요청 탭에서 삭제한다.
-- 회원 4가 회원 3의 팔로우 요청을 거절한다.
DELETE FROM follow
WHERE follower_id = 3 AND followed_id = 4 AND is_acceptance = FALSE;