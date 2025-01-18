-- 작성한 코스 조회
-- 회원 1이 작성한 코스 목록
SELECT course_id, course_name, course_comment, course_scope, course_visited_date, course_visited_weather, likes, is_deleted, is_published, created_at, updated_at, user_id
FROM course
WHERE user_id = 1 AND is_deleted = 'NO';