-- 팔로워 조회
-- 회원 2를 팔로우하는 팔로워 목록
SELECT
       a.follow_id
     , a.follower_id
     , b.user_name AS follower_name
  FROM follow a
  JOIN user b ON a.follower_id = b.user_id
 WHERE a.followed_id = 2
   AND a.is_acceptance = TRUE;
