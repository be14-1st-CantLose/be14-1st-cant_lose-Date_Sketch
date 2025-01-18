SELECT 
    message_id,
    message_contents,
    message_send_at,
    is_deleted,
    from_user_id,
    to_user_id
FROM message
WHERE is_deleted = FALSE
  AND ((from_user_id = 1 AND to_user_id = 2)
       OR (from_user_id = 2 AND to_user_id = 1))
ORDER BY message_id ASC;
