-- 사용자 차단 등록
INSERT INTO ban (user_ban_id, user_banned_id)
VALUES 
    (1, 2); -- 1번 회원이 2번 회원을 차단

SELECT * FROM ban;

-- 특정 사용자 차단 해제
DELETE 
 FROM ban
WHERE user_ban_id = 1 AND user_banned_id = 2; -- 1번 회원이 2번 회원에 대한 차단 해제


SELECT * FROM ban;

-- ----------------
-- 팔로우 등록 
INSERT 
INTO follow (is_acceptance, follower_id, followed_id)
VALUES (TRUE, 1, 2);

SELECT * FROM follow;
-- ----------------------
-- 팔로우 되어있을 때 차단을 하는 경우 팔로우 해제하는 트리거
DELIMITER //

CREATE TRIGGER after_ban_inserts
AFTER INSERT ON ban
FOR EACH ROW
BEGIN
    -- 차단한 사용자와 차단당한 사용자 간의 팔로우 관계를 삭제 (사람1 → 사람2)
    DELETE FROM follow
    WHERE follower_id = NEW.user_ban_id AND followed_id = NEW.user_banned_id;

    -- 차단당한 사용자와 차단한 사용자 간의 팔로우 관계를 삭제 (사람2 → 사람1)
    DELETE FROM follow
    WHERE follower_id = NEW.user_banned_id AND followed_id = NEW.user_ban_id;
END;
//

DELIMITER ;

