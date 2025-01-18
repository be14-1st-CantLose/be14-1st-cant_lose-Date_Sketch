-- 주간 내에 작성된 코스 중 좋아요가 가장 많은 상위 20개 코스를 조회하는 쿼리
-- (수정1) c.course_comment 삭제
-- 주간 날짜 이번주로 설정 ->  발표날 기준 주간 인기 게시물 확인 가능
-- 비공개 코스도 뜨도록 설정했음. 궁금해서 팔로우 하는 사람도 많아질 것이라 생각함.
SELECT course_name, user_id, created_at, course_scope, likes
  FROM course
 WHERE created_at >= '2025-01-13'                     -- 2025년 1월 1일부터
   AND created_at < '2025-01-19'                      -- 2025년 2월 1일 이전 (1월 마지막 날짜까지)
 GROUP BY course_id                                   -- 코스별로 그룹화
 ORDER BY likes DESC                                  -- 좋아요 수 기준 내림차순 정렬
 LIMIT 20;