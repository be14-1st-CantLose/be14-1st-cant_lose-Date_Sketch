-- 작성한 댓글 확인
-- 회원 2가 작성한 댓글 목록
SELECT
       a.comment_id
     , a.user_id
     , a.comment_contents
     , a.created_at
     , b.place_name
     , c.course_name
  FROM comment a
 LEFT JOIN place b ON a.place_id = b.place_id
 LEFT JOIN course c ON a.course_id = c.course_id
 WHERE a.user_id = 2 AND a.is_deleted = FALSE;