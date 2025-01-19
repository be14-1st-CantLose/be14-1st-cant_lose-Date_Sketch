-- 팔로잉 조회
-- 회원 1이 팔로우중인 회원 목록
SELECT
       a.follow_id
     , a.followed_id
     , b.user_name AS followed_name
  FROM follow a
  JOIN user b ON a.followed_id = b.user_id
 WHERE a.follower_id = 1 AND a.is_acceptance = TRUE;