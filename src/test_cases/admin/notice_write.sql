USE test;
select * from user;
-- 공지사항 작성
-- 관리자 로그인과 함께 보이면 좋은가? 상관없으면 그냥 이렇게 해도 될거 같다.
INSERT
  INTO notice
(
  notice_title
, notice_contents
, user_id
)
VALUES
(
  '25-01-17 점검내역'
, '장소 뱃지 50군데 뱃지를 뺏습니다.'
, 2
);

SELECT
       notice_title
     , notice_contents
     , updated_at
  FROM notice;

select * from notice;