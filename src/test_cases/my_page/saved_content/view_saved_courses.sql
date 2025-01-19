-- 저장한 코스 확인
-- 회원 1이 저장한 코스 목록
SELECT
       a.saved_id
     , a.user_id
     , b.course_name
     , b.course_comment
     , b.course_visited_date
     , b.is_published
     , b.likes
     , c.saved_category_name
  FROM save a
  JOIN course b ON a.course_id = b.course_id
  JOIN save_category c ON a.category_id = c.saved_category_id
 WHERE a.user_id = 2
   AND a.save_type = 'COURSE';