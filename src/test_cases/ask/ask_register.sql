USE test;
-- 문의 등록(사용자)
INSERT
  INTO ask
(
  ask_title
, ask_contents,user_id
)
VALUES
(
  '개인적으로 궁금합니다.'
, '왜 저 저번달 골드였는데 실버됐나요?'
, 1
);
-- 문의 확인
SELECT
       ask_title
     , ask_contents
     , ask_reply
     , created_at
     , ask_response_at
  FROM ask;