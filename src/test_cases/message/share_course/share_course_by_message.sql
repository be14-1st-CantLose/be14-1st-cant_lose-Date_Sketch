SET @send_user =1;
SET	@receive_user=5;
SET @message_test="/b5991ab17d3adba3a262b7ae995ab9d0 1";        -- 이런 형식으로 오면 course_id가 1인 코스를 보내는 것
-- thisiscoursewowunbelievable 이 텍스트를 MD5 해시 알고리즘으로 변환한 것

SET @message_test="/510a8d3fb8a4ea511b0b496d146c6a42 1";        -- 이런 형식으로 오면 place_id가 1인 코스를 보내는 것
-- thisisplacewowunbelievable 이 텍스트를 MD5 해시 알고리즘으로 변환한 것

INSERT INTO message (message_contents, from_user_id, to_user_id)
SELECT 
    (SELECT @message_test) AS message_contents,
    (SELECT @send_user) AS from_user_id,
    (SELECT @receive_user) AS to_user_id
WHERE 
    -- 수신자가 비공개 계정이 아닌 경우
    (SELECT user_status FROM user WHERE user_id = (SELECT @receive_user)) = 'PUBLIC'
    -- 수신자가 비공개 계정이더라도 발신자를 팔로우하고 있는 경우
    OR EXISTS (
        SELECT 1 -- 수정 x
        FROM follow 
        WHERE follower_id = @receive_user AND followed_id = (SELECT @send_user) AND is_acceptance = TRUE
    )
    -- 수신자가 발신자를 차단하지 않은 경우
    AND NOT EXISTS (
        SELECT 1 -- 수정 x
        FROM ban 
        WHERE user_ban_id = @receive_user AND user_banned_id = (SELECT @send_user)
    );
