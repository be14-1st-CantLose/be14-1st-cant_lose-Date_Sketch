SET	@var_comment_id_to_delete=2; -- 지우려는 댓글
SET @var_user_id=1; -- 댓글을 삭제하려는 유저 

UPDATE comment
SET 
	is_deleted=1
WHERE
	comment_id =@var_comment_id_to_delete
	AND user_id = @var_user_id;