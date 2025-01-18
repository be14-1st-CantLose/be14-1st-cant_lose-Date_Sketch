-- 사용자 차단 등록
INSERT INTO ban (user_ban_id, user_banned_id)
VALUES 
    (1, 2); -- 1번 회원이 2번 회원을 차단

SELECT * FROM ban;
