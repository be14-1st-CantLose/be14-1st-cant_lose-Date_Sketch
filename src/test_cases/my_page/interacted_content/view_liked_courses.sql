-- 좋아요한 코스 확인
-- 회원 1이 좋아요한 코스 확인
SELECT
       a.likes_id
     , a.user_id
     , a.likes_type
     , b.course_name
     , b.course_comment
     , b.course_scope
     , b.course_visited_date
     , b.course_visited_weather
     , b.created_at
     , b.updated_at
     , b.likes
  FROM likes a
  JOIN course b ON a.course_id = b.course_id
 WHERE a.user_id = 1 AND a.likes_type = 'COURSE';