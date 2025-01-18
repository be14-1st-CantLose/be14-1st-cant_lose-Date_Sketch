USE test;
-- 장소 등록
-- 사용자나 관리자는 장소를 등록한다.
INSERT INTO place (place_name, addr_gu, addr_detail, phone_number,  operation_hours, link, user_id)
VALUES
('오튀그', '서울특별시 종로구', '율곡로10길 77', '0507-1387-1821', '12:00~20:00', 'https://naver.me/5PVaVC3T', 1),
('대성성 서순라길', '서울특별시 종로구', '율곡로10길 25-3', '0507-1319-0450', '11:00~21:00', 'https://naver.me/xVBcOA4T', 1),
('솔방울 베이커리', '서울특별시 종로구', '서순라길 89-15', '0507-1349-1201', '11:00~21:00', 'https://naver.me/5UEcbFHT', 1),
('청계천', '서울특별시 종로구', '창신동', NULL, NULL, 'https://naver.me/FK5viboB', 1),
('교보문고 광화문점', '서울특별시 종로구', '교보생명빌딩 지하 1층', '1544-1900', '09:30~22:00', 'https://naver.me/xtgpqcS3', 1),
('밀포유 인사동점', '서울특별시 종로구', '인사동8길 13', '010-4037-9743', '11:00~21:00 브레이크타임 : 15:00~17:00', 'https://naver.me/xP8mBOhO', 1);