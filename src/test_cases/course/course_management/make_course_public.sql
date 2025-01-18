-- 코스 공개  전환
UPDATE course
SET course_scope = 'PUBLIC'
WHERE course_id = 1
  AND course_scope = 'PRIVATE';  -- 현재 비공개 상태인 경우에만 변경
