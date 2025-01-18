USE test;

-- 개인 정보 수정
UPDATE user
   SET user_name = '이필규'
     , user_nickname = '필규천재'
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = 1234;

-- 개인 정보 수정 확인
SELECT
        *
FROM user
WHERE user_email ='abc9541@gmail.com';