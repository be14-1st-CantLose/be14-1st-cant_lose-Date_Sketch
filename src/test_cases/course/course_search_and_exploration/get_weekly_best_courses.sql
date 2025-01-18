-- 주간 내에 작성된 코스 중 좋아요가 가장 많은 상위 20개 코스를 조회하는 쿼리
-- (수정1) c.course_comment 삭제
-- 주간 날짜 이번주로 설정 ->  발표날 기준 주간 인기 게시물 확인 가능
-- 비공개 코스도 뜨도록 설정했음. 궁금해서 팔로우 하는 사람도 많아질 것이라 생각함.
SELECT c.course_name, COUNT(l.likes_id) AS like_count, c.user_id, c.created_at, c.course_scope
FROM course c
         JOIN likes l ON c.course_id = l.course_id
WHERE l.likes_type = 'COURSE'
  AND c.created_at >= '2025-01-13'                      -- 2025년 1월 13일 (월요일)
  AND c.created_at <= '2025-01-19'                      -- 2025년 1월 19일 (일요일)
GROUP BY c.course_id                                    -- 코스별로 그룹화
ORDER BY like_count DESC                                -- 좋아요 수 기준 내림차순 정렬
LIMIT 20;