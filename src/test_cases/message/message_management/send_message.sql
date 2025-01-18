INSERT INTO message (message_contents, from_user_id, to_user_id)
SELECT 
    'Hello, this is a message!' AS message_contents,
    1 AS from_user_id,
    5 AS to_user_id
WHERE 
    -- 수신자가 비공개 계정이 아닌 경우
    (SELECT user_status FROM user WHERE user_id = 5) = 'PUBLIC'
    -- 수신자가 비공개 계정이더라도 발신자를 팔로우하고 있는 경우
    OR EXISTS (
        SELECT 1 -- 수정 x
        FROM follow 
        WHERE follower_id = 5 AND followed_id = 1 AND is_acceptance = TRUE
    )
    -- 수신자가 발신자를 차단하지 않은 경우
    AND NOT EXISTS (
        SELECT 1 -- 수정 x
        FROM ban 
        WHERE user_ban_id = 5 AND user_banned_id = 1
    );
