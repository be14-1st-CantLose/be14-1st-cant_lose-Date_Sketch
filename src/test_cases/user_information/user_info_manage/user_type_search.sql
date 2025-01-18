USE test;

-- 회원 등급 검색
SELECT
       user_type
  FROM user
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = '06030603';