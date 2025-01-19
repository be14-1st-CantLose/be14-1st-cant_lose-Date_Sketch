-- 마이페이지에 테스트 시 필요한 데이터

-- 회원 4명
INSERT INTO user (
    user_email,
    user_pwd,
    user_name,
    user_phone,
    user_nickname,
    user_gender,
    user_status,
    user_suspension_at,
    user_type,
    is_deleted,
    tier_id
)
VALUES (
           'testuser@example.com',
           'hashed_password',
           'Test User',
           '010-1234-5678',
           'testnickname',
           'MALE',
           'PUBLIC',
           NULL,
           'COMMON',
           FALSE,
           1
       ),
       (
           'testuser2@example.com',
           'hashed_password',
           'Test User2',
           '010-2345-6789',
           'testnickname2',
           'FEMALE',
           'PRIVATE',
           NULL,
           'COMMON',
           FALSE,
           1
       ),(
           'testuser3@example.com',
           'hashed_password',
           'Test User',
           '010-8080-8080',
           'testnickname3',
           'MALE',
           'PUBLIC',
           NULL,
           'COMMON',
           FALSE,
           1
       ),
       (
           'testuser4@example.com',
           'hashed_password',
           'Test User4',
           '010-9090-9090',
           'testnickname4',
           'FEMALE',
           'PRIVATE',
           NULL,
           'COMMON',
           FALSE,
           1
       );

-- 저장 카테고리 2개
INSERT INTO save_category
(saved_category_name, user_id)
VALUES
('Travel', 1),
('Food', 2);
SELECT * FROM save_category;
-- 장소 4개
INSERT INTO place
(place_name, addr_gu, addr_detail, phone_number, homepage, operation_hours, link, is_verified, rating_avg, rating_count, user_id)
VALUES
('Happy Cafe', 'Gangnam-gu', '123 Gangnam Street', '02-123-4567', 'http://happycafe.com', '09:00-22:00', 'http://maps.google.com/happycafe', 'YES', 0, 0, 1),
('Relax Park', 'Jongno-gu', '45 Jongno Avenue', NULL, NULL, '24 Hours', NULL, 'NO', 0, 0, 1),
('Book Haven', 'Seocho-gu', '78 Seocho Road', '02-234-5678', 'http://bookhaven.com', '10:00-20:00', 'http://maps.google.com/bookhaven', 'YES', 0, 0, 1),
('Fitness Center', 'Mapo-gu', '98 Mapo Lane', '02-345-6789', NULL, '06:00-23:00', 'http://maps.google.com/fitnesscenter', 'NO', 0, 0, 1);

SELECT * FROM place;

-- 코스 2개
INSERT INTO course
(course_name, course_comment, course_scope, course_visited_date, course_visited_weather, likes, is_deleted, is_published, user_id)
VALUES
('Seoul City Tour', 'A scenic route through the heart of Seoul.', 'PUBLIC', '2025-01-10 10:00:00', 'Sunny', 0, 'NO', 'PUBLIC', 1),
('Hidden Trails', 'A private trail in the mountains.', 'PRIVATE', NULL, NULL, 0, 'NO', 'PRIVATE', 1);
SELECT * FROM course;
-- 코스 별 장소
INSERT INTO course_locations (course_id, place_id, place_seq)
VALUES
-- 코스 1: 장소 1, 2, 3, 코스 별 장소
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
-- 코스 2: 장소 2, 3, 4
(2, 2, 1),
(2, 3, 2),
(2, 4, 3);

-- 차단 데이터
INSERT INTO ban (user_ban_id, user_banned_id) VALUES (1, 4);
-- 저장 데이터(장소)
INSERT INTO save (category_id, user_id, save_type, place_id)
VALUES
(1, 2, 'PLACE', 1),
(1, 2, 'PLACE', 2);

-- 저장 데이터(코스)
INSERT INTO save (category_id, user_id, save_type, course_id)
VALUES
    (1, 2, 'COURSE', 1);
SELECT * FROM save;
select * from save_category;
select * from course;
select * from place;
-- 댓글 데이터
insert into comment (comment_contents, comment_type, place_id, user_id) values ('멋있어요', 'PLACE', 1, 2);
insert into comment (comment_contents, comment_type, course_id, user_id) values ('힙시해요', 'COURSE', 1, 3);

-- 좋아요 데이터