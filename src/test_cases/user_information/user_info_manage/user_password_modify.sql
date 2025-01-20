USE test;

-- 비밀번호 변경
UPDATE user
   SET user_pwd = 'hashed_pwd'
 WHERE user_name = '이필규'
   AND user_email = 'abc9541@gmail.com'
   AND user_phone = '010-1234-1234';

-- 바뀐 비밀번호 확인(재 로그인)
SELECT
       *
  FROM user
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = 'hashed_pwd';


