USE test;

-- 비밀번호 변경
UPDATE user
   set user_pwd = '06030603'
 WHERE user_name = '이준규'
   AND user_email = 'abc9541@gmail.com'
   AND user_phone = '010-1234-1234';

-- 바뀐 비밀번호 확인(재 로그인)
SELECT
        *
  FROM user
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = '06030603';


