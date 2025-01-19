USE test;
-- 관리자 로그인?이 필요할까?
-- 문의 사항 답변(관리자)
UPDATE ask
   SET ask_reply = '저희 등급 시스템은 저희의 내부 규율이라 알려드릴 수 없습니다.'
     , ask_response_at = CURRENT_TIMESTAMP
 WHERE ask_id = 1;

-- 답변이 됐는지 확인한다.
SELECT
       ask_title
     , ask_contents
     , ask_reply
     , created_at
     , ask_response_at
  FROM ask;