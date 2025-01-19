-- 관리자 신고자 및 사용자 관리에 필요한 데이터
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
           'PUBLIC',
           NULL,
           'COMMON',
           FALSE,
           1
       );

insert into comment (comment_contents, comment_type, place_id, user_id) values ('멋있어요', 'PLACE', 1, 1);
insert into comment (comment_contents, comment_type, course_id, user_id) values ('힙시해요', 'COURSE', 1, 1);

insert into message (message_contents, from_user_id, to_user_id) values ('ㅎㅇㅎㅇ', 1, 2);

insert into report (report_contents, reported_user_id, report_user_id, report_type, course_id)
values ('코스가 부적절한 장소를 포함하고 있음', 1, 2, 'COURSE', 1);

insert into report (report_contents, reported_user_id, report_user_id, report_type, place_id)
values ('장소가 없어짐', 1, 2, 'PLACE', 1);

insert into report (report_contents, reported_user_id, report_user_id, report_type, comment_id)
values ('댓글이 불쾌해요', 1, 2, 'COMMENT', 1);

insert into report (report_contents, reported_user_id, report_user_id, report_type, message_id)
values ('왜 메시지 보내나 불쾌해요', 1, 2, 'MESSAGE', 1);