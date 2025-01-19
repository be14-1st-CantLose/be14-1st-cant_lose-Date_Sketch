-- 팔로우 시, 공개 계정 자동 팔로우 수락

DROP PROCEDURE IF EXISTS after_update_follow;

DELIMITER //

CREATE OR REPLACE PROCEDURE after_update_follow(
    IN req_followed_user_id INT
)
BEGIN
    DECLARE status VARCHAR(255);

    SELECT user_status into status
      FROM user
     WHERE user_id = req_followed_user_id;

    IF status = 'PUBLIC' THEN
        UPDATE follow
           SET is_acceptance = TRUE
         WHERE followed_id = req_followed_user_id;
    END IF;
END //

delimiter ;

