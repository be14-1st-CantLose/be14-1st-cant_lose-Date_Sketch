-- 저장한 코스 확인
-- 회원 1이 저장한 코스 목록
SELECT s.saved_id, c.course_name, c.course_comment,c.course_visited_date, c.likes, sc.saved_category_name
FROM save s
         JOIN course c ON s.course_id = c.course_id
         JOIN save_category sc ON s.category_id = sc.saved_category_id
WHERE s.user_id = 1 AND s.save_type = 'COURSE';