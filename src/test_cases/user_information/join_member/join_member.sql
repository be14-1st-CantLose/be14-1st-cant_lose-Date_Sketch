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
, '1234'
, '이준규'
, '010-1234-1234'
, '준규준규'
, 'MALE'
, 'PUBLIC'
);
