-- 코스 공개 범위를 공개로 설정
-- 코스 1의 공개 범위를 PUBLIC으로 변경
UPDATE course
   SET course_scope = 'PUBLIC'
WHERE course_id = 1
  AND user_id = 1
  AND course_scope = 'PRIVATE'
  AND is_published = 'PUBLIC';