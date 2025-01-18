-- 특정 사용자 차단 해제
DELETE 
 FROM ban
WHERE user_ban_id = 1 AND user_banned_id = 2; -- 1번 회원이 2번 회원에 대한 차단 해제

select * from ban;
