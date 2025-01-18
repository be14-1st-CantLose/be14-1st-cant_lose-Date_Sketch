SELECT
       a.saved_id
     , a.category_id
     , a.user_id
     , a.save_type
     , b.course_id
     , b.course_name
     , b.course_comment
     , b.course_scope
     , b.course_visited_date
     , b.course_visited_weather
     , b.likes
     , b.is_deleted
     , b.is_published
     , b.created_at
     , b.updated_at
 FROM save a
 JOIN course b ON a.course_id = b.course_id
WHERE a.user_id = 2
  AND a.save_type = 'COURSE';