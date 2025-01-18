-- 코스 비공개 전환
UPDATE course
SET course_scope = 'PRIVATE'
WHERE course_id = 1
  AND course_scope = 'PUBLIC';  -- 현재 공개 상태인 경우에만 변경
