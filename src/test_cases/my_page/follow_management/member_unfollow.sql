-- 회원 언팔로우
-- 회원 2가 회원 1를 언팔로우 한다.
DELETE
  FROM follow
 WHERE follower_id = 2
   AND followed_id = 1;
select * from follow;