USE test;

-- 비밀번호 찾기
SELECT
        user_name
  FROM user
 WHERE user_name = '이준규'
   AND user_email = 'abc9541@gmail.com'
   AND user_phone = '010-1234-1234';
-- 회원 이름이 나왔으면, 백엔드에서 이메일 인증을 했다는 가정

