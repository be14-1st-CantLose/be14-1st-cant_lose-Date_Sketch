INSERT INTO comment (comment_contents, created_at, updated_at, is_deleted, likes, user_id, comment_type, course_id, place_id, recomment_id)
VALUES 
    -- 코스에 대한 일반 댓글
    ('정말 멋진 코스입니다!', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE, 10, 1, 'COURSE', 1, NULL, NULL),
    ('정말 멋진 코스입니다.......', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE, 10, 1, 'COURSE', 1, NULL, NULL),
    ('이 코스는 관리가 필요해 보입니다.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE, 5, 2, 'COURSE', 1, NULL, NULL);
