USE test;

-- 공지사항 삭제
DELETE
  FROM notice
 WHERE notice_title = '25-01-17 점검내역(수정됨)';

-- 삭제 확인
select * from notice;