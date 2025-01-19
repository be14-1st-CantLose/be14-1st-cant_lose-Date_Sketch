INSERT
  INTO message
(
  message_contents
 , from_user_id
 , to_user_id
)
VALUES
(
  '안녕하세요'
 , 2
 , 1
 );

/*
보통 이런 로직은 백엔드에서 처리하는 걸로 알고 있습니다! 간단하게 들어가는지만 테스트 해보면 될 것 같아서
수정하겠습니다
*/
-- SET @send_user =1;
-- SET	@receive_user=5;
-- SET @message_test="Hello World!";

-- INSERT INTO message (message_contents, from_user_id, to_user_id)
-- SELECT 
--     (SELECT @message_test) AS message_contents,
--     (SELECT @send_user) AS from_user_id,
--     (SELECT @receive_user) AS to_user_id
-- WHERE 
--     -- 수신자가 비공개 계정이 아닌 경우
--     (SELECT user_status FROM user WHERE user_id = (SELECT @receive_user)) = 'PUBLIC'
--     -- 수신자가 비공개 계정이더라도 발신자를 팔로우하고 있는 경우
--     OR EXISTS (
--         SELECT 1 -- 수정 x
--         FROM follow 
--         WHERE follower_id = @receive_user AND followed_id = (SELECT @send_user) AND is_acceptance = TRUE
--     )
--     -- 수신자가 발신자를 차단하지 않은 경우
--     AND NOT EXISTS (
--         SELECT 1 -- 수정 x
--         FROM ban 
--         WHERE user_ban_id = @receive_user AND user_banned_id = (SELECT @send_user)
--     );

