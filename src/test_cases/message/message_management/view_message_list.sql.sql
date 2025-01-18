-- 기존 테이블의 구조를 유지하면서 새 CHECK 조건을 반영
ALTER TABLE report
  DROP CHECK report_type, -- 잘못된 CHECK 조건 제거
  ADD CHECK (report_type IN ('COMMENT', 'PLACE, PLACE;, ..")).VALID! `
