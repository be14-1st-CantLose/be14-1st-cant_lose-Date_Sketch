-- 최신 코스 조회
-- created_at 할까 updated_at 할까..? 본인 게시물 상단에 띄워놓으려고 계속 수정하는 사람 있지 않을까???
-- 근데 그러면 임시등록 했다가 올리는 사람은?
SELECT *
FROM course
ORDER BY created_at DESC;