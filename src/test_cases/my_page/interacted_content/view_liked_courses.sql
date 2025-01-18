-- 좋아요한 코스 확인
-- 회원 1이 좋아요한 코스 확인
SELECT l.likes_id, l.user_id, l.likes_type, c.course_name, c.course_comment, c.course_scope, c.course_visited_date, c.course_visited_weather, c.created_at, c.updated_at, c.likes
FROM likes l
         JOIN course c ON l.course_id = c.course_id
WHERE l.user_id = 1 AND l.likes_type = 'COURSE';