-- 사용자 차단 등록
INSERT INTO ban (user_ban_id, user_banned_id)
VALUES 
    (1, 2); -- 1번 회원이 2번 회원을 차단

SELECT * FROM ban;

-- 특정 사용자 차단 해제
DELETE 
 FROM ban
WHERE user_ban_id = 1 AND user_banned_id = 2; -- 1번 회원이 2번 회원에 대한 차단 해제
