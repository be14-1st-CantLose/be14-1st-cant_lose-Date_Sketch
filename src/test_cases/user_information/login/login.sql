-- 로그인 성공 쿼리
SELECT
        *
  FROM user
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = '1234';

-- 로그인 실패 쿼리
SELECT
        *
  FROM user
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = '4321';
