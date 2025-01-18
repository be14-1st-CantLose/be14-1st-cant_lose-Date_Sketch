SET @var_course_name="다음주에는 어디 가지?";
SET @var_course_comment="저번에 거기 갈까?";
SET @var_course_scope="PUBLIC";
SET @var_course_visited_date="2025-01-28";
SET @var_course_visited_weather="맑음";
SET @var_user_id=1;

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
    'PRIVATE', 
    @var_user_id
);
