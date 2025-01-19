-- 회원 팔로우(공개 계정)
INSERT
INTO follow
(
  follower_id
, followed_id
)
VALUES
(
  2
, 1
);
-- 팔로우가 들어올 시, 저장 프로시저 호출을 해줘야 함(공개 계정 자동 팔로우)
CALL after_update_follow(1);

-- 회원 팔로우(비공개 계정)
INSERT
INTO follow
(
  follower_id
, followed_id
)
VALUES
(
  3
, 4
);
-- 회원 팔로우(비공개 계정)
INSERT
INTO follow
(
  follower_id
, followed_id
)
VALUES
(
  1
, 2
);