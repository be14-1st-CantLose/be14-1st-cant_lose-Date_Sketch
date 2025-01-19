DROP TRIGGER IF EXISTS handle_report_resolution;

DELIMITER $$

CREATE TRIGGER handle_report_resolution
    AFTER UPDATE ON report
    FOR EACH ROW
BEGIN
    DECLARE report_count INT DEFAULT 0;
    -- 신고 상태가 'YES'로 변경되었는지 확인
    IF NEW.report_approved = 'YES' AND OLD.report_approved != 'YES' THEN
        -- 신고 대상자의 누적 신고 횟수 계산

    SELECT COUNT(*)
    INTO report_count
    FROM report
    WHERE reported_user_id = NEW.reported_user_id AND report_approved = 'YES';

    -- 정지 상태 및 정지 종료일 계산
    IF report_count >= 9 THEN
            -- 영구 정지
    UPDATE user
    SET user_suspension_at = '9999-12-31 23:59:59'
    WHERE user_id = NEW.reported_user_id;
    ELSEIF report_count >= 6 THEN
            -- 30일 정지
    UPDATE user
    SET user_suspension_at = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 30 DAY)
    WHERE user_id = NEW.reported_user_id;
    ELSEIF report_count >= 3 THEN
            -- 7일 정지
    UPDATE user
    SET user_suspension_at = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY)
    WHERE user_id = NEW.reported_user_id;
END IF;
END IF;
END $$

DELIMITER ;
-- --------------------
SELECT * FROM report;
UPDATE report
SET report_approved = 'YES'
WHERE reported_user_id = '2';
SELECT * FROM user WHERE user_id = 2;

-- -------------------
INSERT INTO report (created_at, report_contents, report_approved, report_type, reported_user_id, report_user_id, comment_id)
VALUES
    (CURRENT_TIMESTAMP, '욕설이 포함된 댓글입니다.', 'NO', 'COMMENT', 2, 5, 5);


iNSERT INTO report (created_at, report_contents, report_approved, report_type, reported_user_id, report_user_id, comment_id)
VALUES
    (CURRENT_TIMESTAMP, '욕설이 포함된 댓글입니다.', 'NO', 'COMMENT', 2, 5, 4);

iNSERT INTO report (created_at, report_contents, report_approved, report_type, reported_user_id, report_user_id, comment_id)
VALUES
    (CURRENT_TIMESTAMP, '욕설이 포함된 댓글입니다.', 'NO', 'COMMENT', 2, 5, 3);