SET	@var_comment_id_to_eddit=3;
SET	@var_eddited_comment="2번 유저는3번 댓글을 수정할 수 있습니다."; -- 댓글 내용
SET @var_user_id=2; -- 댓글 다는 유저 아이디 

UPDATE comment
SET 
    comment_contents = @var_eddited_comment,
    updated_at = CURRENT_TIMESTAMP
WHERE
	comment_id =@var_comment_id_to_eddit
	AND user_id = @var_user_id;