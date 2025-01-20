    -- 회원 가입 쿼리
USE test;
select * from user;
INSERT INTO user
(
  user_email
, user_pwd
, user_name
, user_phone
, user_nickname
, user_gender
, user_status
)
VALUES
(
  'abc9541@gmail.com'
, 'hashed_password'
, '이준규'
, '010-1234-1234'
, '준규준규'
, 'MALE'
, 'PUBLIC'
);

-- 관리자 회원가입
INSERT
INTO user
(
  user_email
, user_pwd
, user_name
, user_phone
, user_nickname
, user_gender
, user_type
,user_status
)
VALUES
(
  'yemong@gmail.com'
, 'hashed_password'
, '이예원'
, '010-1234-1234'
, 'AD예몽'
, 'FEMALE'
, 'ADMIN'
,'PUBLIC'
);

-- 여기에 unique 제약 조건 걸려있는 이메일로 가입 시에, 오류 발생
