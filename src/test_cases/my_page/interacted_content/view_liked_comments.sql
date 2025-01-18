-- 좋아요한 댓글 확인
-- 회원 1이 좋아요한 댓글 확인
SELECT l.likes_id, l.user_id, l.likes_type, c.comment_type, c.comment_contents, c.created_at, c.updated_at, c.likes
FROM likes l
         JOIN comment c ON l.comment_id = c.comment_id
WHERE l.user_id = 1 AND l.likes_type = 'COMMENT';