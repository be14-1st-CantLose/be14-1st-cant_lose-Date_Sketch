-- 코스 삭제 soft
UPDATE course
SET is_deleted = 'YES', updated_at = CURRENT_TIMESTAMP
WHERE course_id = @course_id
  AND is_deleted = 'NO';  -- 이미 삭제되지 않은 코스만 삭제 처리