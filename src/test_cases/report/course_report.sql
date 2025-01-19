-- ------------------
-- 코스 신고 등록
INSERT INTO report (created_at, report_contents, report_approved, report_type, reported_user_id, report_user_id, course_id)
VALUES 
    (CURRENT_TIMESTAMP, '코스 정보가 부정확합니다.', 'NO', 'COURSE', 2, 1, 1);

SELECT * FROM COMMENT;
