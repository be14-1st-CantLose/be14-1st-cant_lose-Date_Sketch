-- 팔로우 시, 공개 계정 자동 팔로우 수락

DROP TRIGGER IF EXISTS after_follow_update;

DELIMITER //

CREATE TRIGGER after_follow_update
AFTER INSERT ON follow
FOR EACH ROW
BEGIN
    DECLARE status VARCHAR(255);

    -- 팔로우된 사용자의 상태 조회
    SELECT user_status INTO status
      FROM user
     WHERE user_id = NEW.followed_id;

    -- 공개 계정인 경우 자동으로 수락 처리
    IF status = 'PUBLIC' THEN
        UPDATE follow
           SET is_acceptance = TRUE
         WHERE follow_id = NEW.follow_id;
    END IF;
END //

DELIMITER ;