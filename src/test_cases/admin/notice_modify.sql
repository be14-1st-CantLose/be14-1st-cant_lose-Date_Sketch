USE test;

-- 공지사항 수정
UPDATE notice
   SET notice_title = '25-01-17 점검내역(수정됨)'
     , notice_contents = '장소 뱃지 20개를 확인 후 재발급했습니다.'
 WHERE user_id = 2;

-- 공지사항 재확인
SELECT
       notice_title
     , notice_contents
     , updated_at
FROM notice;
