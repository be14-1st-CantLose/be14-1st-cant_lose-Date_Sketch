-- 변수 설정
SET @var_course_id = 7;                       -- 수정할 코스 ID
SET @var_user_id = 152;                       -- 작성자 ID
SET @var_course_name = '수정된 코스 이름';      -- 수정할 코스 이름
SET @var_course_comment = '수정된 코스 설명';  -- 수정할 코스 설명
SET @var_course_visited_date = '2025-01-20';  -- 수정할 방문 날짜
SET @var_course_visited_weather = '맑음';    -- 수정할 방문 날씨

-- 코스 수정
UPDATE course
SET
    course_name = @var_course_name,            -- 수정할 코스 이름
    course_comment = @var_course_comment,      -- 수정할 코스 설명
    course_visited_date = @var_course_visited_date, -- 수정할 방문 날짜
    course_visited_weather = @var_course_visited_weather, -- 수정할 방문 날씨
    updated_at = CURRENT_TIMESTAMP             -- 수정 시간 갱신
WHERE
    course_id = @var_course_id                 -- 수정 대상 코스 ID
  AND user_id = @var_user_id                 -- 해당 사용자가 작성한 코스만 수정 가능
  AND is_deleted = 'NO'                      -- 삭제되지 않은 코스만 수정 가능
  AND is_published = 'PRIVATE';              -- PRIVATE인 코스만 수정 가능
