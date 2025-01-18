SET	@var_comment_contents="코스에 달리는 첫 번째 댓글입니다."; -- 댓글 내용
SET @var_user_id=1; -- 댓글 다는 유저 아이디 
SET @var_comment_type="COURSE"; -- 코스 댓글
SET @var_place_id=1; -- 댓글이 달리는 장소 게시물 id
INSERT INTO comment (
    comment_contents, 
    user_id, 
    comment_type, 
    place_id
) 
VALUES (
    @var_comment_contents, 
    @var_user_id, 
    @var_comment_type, 
    @var_place_id
);
