-- 월간 내에 작성된 코스 중 좋아요가 가장 많은 상위 20개 코스를 조회하는 쿼리
-- c.course_comment 삭제
-- 날짜 이번 달로 범위 설정(더미데이터가 이번 달 밖에 없음. 그런데 만약 서비스를 만들었다는 가정하에 첫 달은 이렇게 하는게 맞을듯?)
-- 서비스 시작 후 두번째 달까지 1월달 best가 보이고 세번째 달부터 두번째 월 기준 best20으로
-- 비공개 코스도 뜨도록 설정했음. 궁금해서 팔로우 하는 사람도 많아질 것이라 생각함.
SELECT c.course_name, COUNT(l.likes_id) AS like_count, c.user_id, c.created_at, c.course_scope
FROM course c
         JOIN likes l ON c.course_id = l.course_id
WHERE l.likes_type = 'COURSE'
  AND c.created_at >= '2025-01-01'                     -- 2025년 1월 1일부터
  AND c.created_at < '2025-02-01'                      -- 2025년 2월 1일 이전 (1월 마지막 날짜까지)
GROUP BY c.course_id                                   -- 코스별로 그룹화
ORDER BY like_count DESC                               -- 좋아요 수 기준 내림차순 정렬
LIMIT 20;