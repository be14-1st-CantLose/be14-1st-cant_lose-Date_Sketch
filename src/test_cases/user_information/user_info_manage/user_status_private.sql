USE test;

-- 사용자 비공개 전환
UPDATE user
   SET user_status = 'PRIVATE'
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = '06030603';

-- 사용자 비공개 확인
SELECT
       user_name
     , user_email
     , user_nickname
     , user_status
  FROM user
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = '06030603';