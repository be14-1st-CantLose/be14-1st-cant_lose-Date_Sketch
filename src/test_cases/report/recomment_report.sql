-- 대댓글 신고 등록
INSERT INTO report (created_at, report_contents, report_approved, report_type, reported_user_id, report_user_id, comment_id)
VALUES 
    (CURRENT_TIMESTAMP, '욕설이 포함된 댓글입니다.', 'NO', 'COMMENT', 2, 5, 8);
