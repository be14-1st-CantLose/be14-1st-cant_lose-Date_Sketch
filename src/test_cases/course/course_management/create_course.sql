SET @var_course_name="저번주에는 여기 감";
SET @var_course_comment="여기 짱 좋았음";
SET @var_course_scope="PUBLIC";
SET @var_course_visited_date="2025-01-18";
SET @var_course_visited_weather="맑음";
SET @var_user_id=1;
SET @var_course_id = 1505;

-- 코스 생성
INSERT INTO course (
    course_name,
    course_comment,
    course_scope,
    course_visited_date,
    course_visited_weather,
    is_published,
    user_id
)
VALUES (
    @var_course_name,
    @var_course_comment,
    @var_course_scope,
    @var_course_visited_date,
    @var_course_visited_weather,
    'PUBLIC', 
    @var_user_id
);

-- 코스에 장소 매칭(위에 생성된 course_id가 1이라 가정)
INSERT INTO course_locations (course_id, place_id, place_seq)
VALUES
-- 코스 1: 장소 1, 2, 3
(@var_course_id, 1, 1),
(@var_course_id, 2, 2),
(@var_course_id, 3, 3),