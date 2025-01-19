-- 좋아요한 댓글 확인
-- 회원 1이 좋아요한 댓글 확인
SELECT
       a.likes_id
     , a.user_id
     , a.likes_type
     , b.comment_type
     , b.comment_contents
     , b.created_at
     , b.updated_at
     , b.likes
  FROM likes a
  JOIN comment b ON a.comment_id = b.comment_id
 WHERE a.user_id = 1
   AND a.likes_type = 'COMMENT';

select * from likes;