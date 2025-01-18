SET @my_user_id=2;
SET	@other_user_id=1;

SELECT 
    message_id,
    message_contents,
    message_send_at,
    is_deleted,
    from_user_id,
    to_user_id
FROM message
WHERE is_deleted = FALSE
  AND ((from_user_id = (SELECT @my_user_id) AND to_user_id = (SELECT @other_user_id))
       OR (from_user_id = (SELECT @other_user_id) AND to_user_id = (SELECT @my_user_id)))
ORDER BY message_id ASC;
