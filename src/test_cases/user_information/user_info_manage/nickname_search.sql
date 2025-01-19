USE test;

-- 닉네임 검색
SELECT
     , user_id
       user_nickname
  FROM user
 WHERE user_nickname = '준규천재'
   AND is_deleted = FALSE;