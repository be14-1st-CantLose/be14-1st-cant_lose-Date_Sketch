USE test;

-- 회원 탈퇴
UPDATE user
   SET is_deleted = 1
 WHERE user_email = 'abc9541@gmail.com'
   AND user_pwd = '06030603';

-- 회원 탈퇴 조회
SELECT
        is_deleted
  FROM user
 WHERE user_email = 'abc9541@gmail.com';
