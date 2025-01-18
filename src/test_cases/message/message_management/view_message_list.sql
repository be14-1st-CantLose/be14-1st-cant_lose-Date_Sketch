SET @view_message_list_user_id=5;

SELECT 
    CASE 
        WHEN from_user_id = (SELECT @view_message_list_user_id) THEN to_user_id
        ELSE from_user_id
    END AS other_user_id, -- 대화를 나눈 상대방 ID
    MAX(message_send_at) AS last_message_at   -- 가장 최근 메시지 시간
FROM message
WHERE 
    from_user_id = (SELECT @view_message_list_user_id) OR to_user_id = (SELECT @view_message_list_user_id) -- 내가 발신자이거나 수신자인 경우
GROUP BY 
    CASE 
        WHEN from_user_id = (SELECT @view_message_list_user_id) THEN to_user_id
        ELSE from_user_id
    END;
