-- 코스 수정
UPDATE course
SET
    course_name = '졸려죽겄다집가고싶다',                  -- 수정할 코스 이름
    course_visited_date = '2025-01-19 14:00:0',        -- 수정할 코스 방문 날짜
    course_visited_weather = '존나맑음',                 -- 수정할 코스 방문 날씨
    course_comment = '에라모르겠다.',                     -- 수정할 코스 설명
    updated_at = CURRENT_TIMESTAMP                      -- 수정일 업데이트
WHERE course_id = 1                                     -- 수정할 코스의 ID
  AND user_id = 279                                     -- 해당 사용자가 작성한 코스만 수정 가능
  AND is_deleted = 'NO';                                -- 삭제되지 않은 코스만 수정 가능