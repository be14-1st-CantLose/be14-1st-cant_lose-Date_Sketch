-- 코스 생성
INSERT
  INTO course
(
  course_name, course_comment, course_scope
, course_visited_date, course_visited_weather, likes
, is_deleted, is_published, user_id
)
VALUES
(
  '서울 나들이이', '봄에 가기 좋은', 'PUBLIC'
, '2025-01-10 10:00:00', 'Sunny', 0
, 'NO', 'PUBLIC', 1
);

-- 코스 별 장소 테이블에 코스, 장소 데이터 입력
INSERT
  INTO course_locations
(
  course_id
, place_id
, place_seq
)
VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3);
-- 코스 1: 장소 1, 2, 3

