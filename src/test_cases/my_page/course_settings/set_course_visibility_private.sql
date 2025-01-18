-- 코스 공개 범위를 비공개로 설정
-- 코스 1의 공개 범위를 PRIVATE로 변경
UPDATE course
SET course_scope = 'PRIVATE'
WHERE course_id = 1 AND user_id = 1;