-- 관리자가 신고 처리 완료 시 해당 사용자의 신고 횟수 관리											

DELIMITER $$

CREATE TRIGGER handle_report_resolution
AFTER UPDATE ON report
FOR EACH ROW
BEGIN
    -- 신고 상태가 'Resolved'로 변경되었는지 확인
    IF NEW.report_approved = 'YES' AND OLD.report_approved != 'YES' THEN
        -- 신고 대상자의 누적 신고 횟수 계산
        SET @report_count = (
            SELECT COUNT(*)
            FROM report
            WHERE user_id = NEW.user_id AND report_approved = 'YES'
        );

        -- 정지 상태 및 정지 종료일 계산
        IF @report_count >= 9 THEN
            UPDATE user
            SET 
                user_suspension_at = '9999-12-31' -- 영구 정지
            WHERE user_id = NEW.user_id;
        ELSEIF @report_count >= 6 THEN
            UPDATE user
            SET 
                user_suspension_at = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 30 DAY) -- 30일 정지
            WHERE user_id = NEW.user_id;
        ELSEIF @report_count >= 3 THEN
            UPDATE user
            SET 
                user_suspension_at = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY) -- 7일 정지
            WHERE user_id = NEW.user_id;
        END IF;
    END IF; -- 외부 IF 종료
END $$

DELIMITER ;
