-- 월간 내에 작성된 코스 중 좋아요가 가장 많은 상위 20개 코스를 조회하는 쿼리
-- c.course_comment 삭제
-- 날짜 이번 달로 범위 설정(더미데이터가 이번 달 밖에 없음. 그런데 만약 서비스를 만들었다는 가정하에 첫 달은 이렇게 하는게 맞을듯?)
-- 서비스 시작 후 두번째 달까지 1월달 best가 보이고 세번째 달부터 두번째 월 기준 best20으로
-- 비공개 코스도 뜨도록 설정했음. 궁금해서 팔로우 하는 사람도 많아질 것이라 생각함.
SELECT course_name, user_id, created_at, course_scope, likes
  FROM course
 WHERE created_at >= '2025-01-01'                     -- 2025년 1월 1일부터
   AND created_at < '2025-02-01'                      -- 2025년 2월 1일 이전 (1월 마지막 날짜까지)
 GROUP BY course_id                                   -- 코스별로 그룹화
 ORDER BY likes DESC                                  -- 좋아요 수 기준 내림차순 정렬
 LIMIT 20;