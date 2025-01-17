-- 회원 가입 쿼리
USE test;
INSERT INTO user
(user_email, user_pwd, user_name, user_phone, user_nickname, user_gender, user_status)
VALUES
    ('abc9541@gmail.com', '1234', '이준규', '010-1234-1234', '준규준규', 'MALE', 'PUBLIC');

-- 회원 가입 쿼리
INSERT INTO user
(user_email, user_pwd, user_name, user_phone, user_nickname, user_gender, user_status)
VALUES
    ('12341234@gmail.com', '1234456', '동한정', '010-4321-4321', '동한동한', 'MALE', 'PUBLIC');

-- 해당 unique 열에 중복된 데이터를 넣으면 회원가입 실패

SELECT * FROM user;
SELECT * FROM save_category;
-- 로그인 성공 쿼리
SELECT * FROM user
WHERE user_email = 'abc9541@gmail.com' AND user_pwd = '1234';

-- 로그인 실패 쿼리
SELECT * FROM user
WHERE user_email = 'abc9541@gmail.com' AND user_pwd = '4321';

-- 아이디 찾기
SELECT user_email FROM user WHERE user_name = '이준규' AND user_phone = '010-1234-1234';

-- 비밀번호 찾기
SELECT user_name FROM user WHERE user_name = '이준규' AND user_email = 'abc9541@gmail.com' AND user_phone = '010-1234-1234';
-- 회원 이름이 나왔으면, 백엔드에서 이메일 인증을 했다는 가정
UPDATE user set user_pwd = '06030603' WHERE user_name = '이준규' AND user_email = 'abc9541@gmail.com' AND user_phone = '010-1234-1234';
-- 바뀐 비밀번호 확인
SELECT user_pwd FROM user WHERE user_name ='이준규';

-- 로그아웃은 백엔드에서 처리 한다.

-- 개인 정보 수정
SELECT user_name FROM user WHERE user_email ='12341234@gmail.com';
UPDATE user SET user_name = '정동한', user_phone = '010-2348-2348' WHERE user_email = '12341234@gmail.com';

-- 비밀 번호 수정
UPDATE user SET user_pwd = '03090309' WHERE user_email = '12341234@gmail.com' AND user_pwd = '1234456';

-- 회원 탈퇴
UPDATE user SET is_deleted = 1 WHERE user_email = '12341234@gmail.com' AND user_pwd = '03090309';
SELECT is_deleted FROM user WHERE user_email = '12341234@gmail.com';

-- 닉네임 검색
SELECT user_nickname FROM user WHERE user_nickname = '준규준규';

-- 계정 종류 전환
UPDATE user SET user_status = 'PRIVATE' WHERE user_email = '12341234@gmail.com' AND user_pwd = '03090309';
SELECT user_name, user_status FROM user WHERE user_email = '12341234@gmail.com';

-- 계정 종류는 업데이트 트리거 완성되면 된다.
