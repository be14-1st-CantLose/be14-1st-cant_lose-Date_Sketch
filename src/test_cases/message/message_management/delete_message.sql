-- 전역 변수 선언 및 초기화
SET @my_user_id = 2; -- 현재 사용자의 ID
SET @message_id_to_delete = 3; -- 삭제하려는 메시지 ID

-- 메시지 삭제 쿼리
UPDATE message
SET is_deleted = 1
WHERE message_id = @message_id_to_delete
  AND from_user_id = @my_user_id;