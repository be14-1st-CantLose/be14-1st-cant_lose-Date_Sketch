-- 작성한 댓글 확인
-- 회원 1이 작성한 댓글 목록
SELECT c.comment_id, c.comment_contents, c.created_at, p.place_name, co.course_name
FROM comment c
         LEFT JOIN place p ON c.place_id = p.place_id
         LEFT JOIN course co ON c.course_id = co.course_id
WHERE c.user_id = 1 AND c.is_deleted = FALSE;