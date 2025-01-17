-- -------------------------------------------------------------------------------------------------전체 수정본
-- -------------------------------------------------------------------------------------------------데이터 베이스 생성
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

-- -------------------------------------------------------------------------------------------------등급 테이블
DROP TABLE IF EXISTS tier;

CREATE TABLE tier
(
    tier_id    INT NOT NULL AUTO_INCREMENT comment '등급 id',
    tier    VARCHAR(255) NOT NULL comment '등급',
 PRIMARY KEY ( tier_id ),
 UNIQUE (tier),
 CHECK (tier IN ('DIA', 'GOLD', 'SILVER', 'COMMON'))
)
 COMMENT = '등급';
 
-- -------------------------------------------------------------------------------------------------티어 데이터 생성
INSERT INTO tier (tier)
VALUES 
    ('COMMON'),
    ('SILVER'),
    ('GOLD'),
    ('DIA');
	 

-- -------------------------------------------------------------------------------------------------회원 테이블
DROP TABLE IF EXISTS user;

CREATE TABLE user
(
    user_id    INT NOT NULL AUTO_INCREMENT COMMENT '회원 id',
    user_email    VARCHAR(255) NOT NULL COMMENT '이메일',
    user_pwd    VARCHAR(255) NOT NULL COMMENT '비밀번호',
    user_name    VARCHAR(255) NOT NULL COMMENT '이름',
    user_phone    VARCHAR(255) NOT NULL COMMENT '휴대폰번호',
    user_nickname    VARCHAR(255) NOT NULL COMMENT '닉네임',
    user_gender    VARCHAR(255) NOT NULL COMMENT '성별',
    user_status    VARCHAR(255) COMMENT '계정 공개 여부',
    created_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입날짜',
    updated_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정날짜',
    user_suspension_at    DATETIME COMMENT '정지 해제 날짜',
    user_type    VARCHAR(255) NOT NULL DEFAULT 'COMMON' COMMENT '회원 구분',
    is_deleted    BOOLEAN DEFAULT FALSE NOT NULL COMMENT '삭제 여부',
    tier_id    INT NOT NULL DEFAULT 1 COMMENT '등급 id', -- 1: 일반
 PRIMARY KEY ( user_id ),
 FOREIGN KEY (tier_id) REFERENCES tier (tier_id),
 UNIQUE (user_email),
 UNIQUE (user_nickname),
 CHECK (user_type IN ('COMMON', 'ADMIN')),
 CHECK (user_status IN ('PUBLIC', 'PRIVATE')),
 CHECK (user_gender IN ('MALE', 'FEMALE'))
)
 COMMENT = '회원';

-- -------------------------------------------------------------------------------------------------저장 카테고리 테이블
DROP TABLE IF EXISTS save_category;

CREATE TABLE save_category
(
    saved_category_id    INT NOT NULL AUTO_INCREMENT COMMENT '저장 카테고리 id',
    saved_category_name    VARCHAR(255) NOT NULL COMMENT '저장 카테고리명',
    user_id    INT NOT NULL COMMENT '저장계정 카테고리 id',
 PRIMARY KEY ( saved_category_id ),
 FOREIGN KEY (user_id) REFERENCES user (user_id)
)
 COMMENT = '저장 카테고리';
 
-- -------------------------------------------------------------------------------------------------장소 테이블
DROP TABLE if exists place;

CREATE TABLE place
(
    place_id    INT NOT NULL AUTO_INCREMENT COMMENT '장소 id',
    place_name    VARCHAR(255) NOT NULL COMMENT '장소 이름',
    addr_gu    VARCHAR(255) NOT NULL COMMENT '주소(구)',
    addr_detail    VARCHAR(255) NOT NULL COMMENT '주소(상세)',
    phone_number    VARCHAR(255) COMMENT '전화번호',
    homepage    VARCHAR(255) COMMENT '홈페이지',
    operation_hours    VARCHAR(255) COMMENT '운영 시간',
    link    VARCHAR(255) COMMENT '링크',
    is_verified    VARCHAR(255)  NOT NULL DEFAULT 'NO' COMMENT '인증 여부',
    rating_avg    DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '별점 평균',
    rating_count    INT NOT NULL DEFAULT 0 COMMENT '별점 카운트',
    user_id    INT NOT NULL COMMENT '장소 작성자 id',
 PRIMARY KEY ( place_id ),
 FOREIGN KEY( user_id ) REFERENCES user(user_id),
 CHECK (is_verified IN ('YES', 'NO')),
 UNIQUE (place_name, addr_detail)
)
 COMMENT = '장소';
 
-- -------------------------------------------------------------------------------------------------공지사항 테이블
DROP TABLE if exists notice;

CREATE TABLE notice
(
    notice_id    INT NOT NULL AUTO_INCREMENT COMMENT '공지사항 id',
    notice_title    VARCHAR(255) NOT NULL COMMENT '제목',
    notice_contents    VARCHAR(255) NOT NULL COMMENT '내용',
    created_at    DATETIME NOT NULL default current_timestamp COMMENT '작성 날짜',
    updated_at    DATETIME NOT NULL default current_timestamp COMMENT '수정 날짜',
    user_id    INT NOT NULL COMMENT '관리자 id',
 PRIMARY KEY ( notice_id ),
 FOREIGN KEY (user_id) REFERENCES user(user_id)
)
 COMMENT = '공지사항';
 
-- -------------------------------------------------------------------------------------------------문의 테이블
 DROP TABLE IF EXISTS ask;

CREATE TABLE ask
(
    ask_id    INT NOT NULL AUTO_INCREMENT COMMENT '문의 id',
    ask_title    VARCHAR(255) NOT NULL COMMENT '문의 제목',
    ask_contents    VARCHAR(255) NOT NULL COMMENT '문의 내용',
    ask_reply    VARCHAR(255) COMMENT '문의 답변',
    created_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '문의 작성 날짜',
    ask_response_at    DATETIME COMMENT '문의 답변 날짜',
    user_id    INT NOT NULL COMMENT '문의 작성 회원 id',
 PRIMARY KEY ( ask_id ),
 FOREIGN KEY (user_id) REFERENCES user(user_id)
)
 COMMENT = '문의'
 ENGINE=INNODB;
 
 -- -------------------------------------------------------------------------------------------------차단 테이블
 DROP TABLE IF EXISTS ban;

CREATE TABLE ban
(
    ban_id    INT NOT NULL AUTO_INCREMENT COMMENT '차단 id',
    user_ban_id    INT NOT NULL COMMENT '차단한 회원 id',
    user_banned_id    INT NOT NULL COMMENT '차단 당한 회원 id',
 PRIMARY KEY ( ban_id ),
 FOREIGN KEY(user_ban_id) REFERENCES user(user_id),
 FOREIGN KEY(user_banned_id) REFERENCES user(user_id),
 UNIQUE(user_ban_id, user_banned_id)
)COMMENT = '차단'
ENGINE=INNODB;

-- -------------------------------------------------------------------------------------------------코스 테이블
DROP TABLE if EXISTS course;

CREATE TABLE course
(
    course_id    INT NOT NULL AUTO_INCREMENT COMMENT '코스 id',
    course_name    VARCHAR(255) NOT NULL COMMENT '코스 이름',
    course_comment    VARCHAR(255) COMMENT '코스 설명',
    course_scope    VARCHAR(255) NOT NULL COMMENT '코스 공개 범위',
    course_visited_date    DATETIME COMMENT '코스 방문 날짜',
    course_visited_weather    VARCHAR(255) COMMENT '코스 방문 날씨',
    likes    INT NOT NULL DEFAULT 0 COMMENT '좋아요 수',
    is_deleted    VARCHAR(255) NOT NULL DEFAULT 'NO' COMMENT '삭제 여부',
    is_published    VARCHAR(255) NOT NULL COMMENT '발행여부',
    created_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일',
    updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '수정일',
    user_id    INT NOT NULL COMMENT '코스 작성자 id',
 PRIMARY KEY ( course_id ),
 FOREIGN KEY (user_id) REFERENCES user(user_id),
 CHECK (is_deleted IN ('YES', 'NO')),
 CHECK (is_published IN ('PUBLIC', 'PRIVATE')),
 CHECK (course_scope IN ('PUBLIC', 'PRIVATE'))
)
 COMMENT = '코스'
 ENGINE=INNODB;
 
-- -------------------------------------------------------------------------------------------------댓글 테이블
DROP TABLE IF EXISTS comment;

CREATE TABLE comment (
    comment_id        INT NOT NULL AUTO_INCREMENT COMMENT '댓글 id',
    comment_contents  VARCHAR(255) NOT NULL COMMENT '댓글 내용',
    created_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성 시간',
    updated_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정 시간',
    is_deleted        BOOLEAN NOT NULL DEFAULT FALSE COMMENT '삭제 여부',
    likes             INT NOT NULL DEFAULT 0 COMMENT '좋아요 수',
    user_id           INT NOT NULL COMMENT '댓글 작성 회원 id',
    comment_type      VARCHAR(255) NOT NULL COMMENT '댓글 구분',
    course_id         INT COMMENT '코스 id',
    place_id          INT COMMENT '장소 id',
    recomment_id      INT COMMENT '대댓글 id',
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (place_id) REFERENCES place(place_id),
    FOREIGN KEY (recomment_id) REFERENCES comment(comment_id),
    CHECK (comment_type IN ('COURSE', 'PLACE', 'COMMENT'))
) COMMENT = '댓글'
ENGINE = INNODB;
 
-- -------------------------------------------------------------------------------------------------코스 별 장소 테이블
 DROP TABLE if EXISTS course_locations;

CREATE TABLE course_locations
(
    course_id    INT NOT NULL AUTO_INCREMENT COMMENT '코스 id',
    place_id    INT NOT NULL COMMENT '장소 id',
    place_seq    INT NOT NULL COMMENT '장소 순서',
 PRIMARY KEY ( course_id, place_id ),
 FOREIGN KEY ( place_id ) REFERENCES place(place_id)
)
 COMMENT = '코스 별 장소';
 
-- -------------------------------------------------------------------------------------------------팔로우 테이블
 DROP TABLE if exists follow;

CREATE TABLE follow
(
    follow_id    INT NOT NULL AUTO_INCREMENT COMMENT '팔로우 id',
    is_acceptance    BOOLEAN NOT NULL DEFAULT FALSE COMMENT '수락여부',
    follower_id    INT NOT NULL COMMENT '회원 id(수신)',
    followed_id    INT NOT NULL COMMENT '회원 id(발신)',
 PRIMARY KEY ( follow_id ),
 FOREIGN KEY ( follower_id ) REFERENCES user(user_id),
 FOREIGN KEY ( followed_id ) REFERENCES user(user_id),
 UNIQUE (follower_id, followed_id)
)
 COMMENT = '팔로우';
 
-- -------------------------------------------------------------------------------------------------좋아요 테이블
 DROP TABLE if exists likes;

CREATE TABLE likes
(
    likes_id    INT NOT NULL AUTO_INCREMENT COMMENT '좋아요 id',
    likes_type    VARCHAR(255) NOT NULL COMMENT '좋아요 구분',
    course_id    INT COMMENT '코스 id',
    comment_id    INT COMMENT '댓글 id',
    user_id    INT NOT NULL COMMENT '좋아요 누른 회원 id',
 PRIMARY KEY ( likes_id ),
 FOREIGN KEY ( course_id ) REFERENCES course (course_id),
 FOREIGN KEY ( comment_id ) REFERENCES comment (comment_id),
 CHECK (likes_type IN ('COURSE', 'COMMENT'))
)
 COMMENT = '좋아요';

-- -------------------------------------------------------------------------------------------------메시지 테이블
 DROP TABLE if exists message;

CREATE TABLE message
(
    message_id    INT NOT NULL AUTO_INCREMENT COMMENT '메시지 id',
    message_contents    VARCHAR(255) NOT NULL COMMENT '메시지 내용',
    message_send_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '메시지 보내는 시간',
    is_deleted    BOOLEAN NOT NULL DEFAULT FALSE COMMENT '삭제 여부',
    from_user_id    INT NOT NULL COMMENT '회원 id(발신)',
    to_user_id    INT NOT NULL COMMENT '회원 id(수신)',
 PRIMARY KEY ( message_id ),
 FOREIGN KEY ( from_user_id ) REFERENCES user (user_id),
 FOREIGN KEY ( to_user_id ) REFERENCES user (user_id)
 
)
 COMMENT = '메시지';

-- -------------------------------------------------------------------------------------------------별점 테이블
DROP TABLE IF EXISTS rating;

CREATE TABLE rating
(
    rating_id    INT NOT NULL AUTO_INCREMENT COMMENT '별점 id',
    rating_score    INT NOT NULL COMMENT '별점 점수',
    user_id    INT NOT NULL COMMENT '회원 id',
    place_id    INT NOT NULL COMMENT '장소 id',
 PRIMARY KEY ( rating_id ),
 FOREIGN KEY (user_id) REFERENCES user (user_id),
 FOREIGN KEY (place_id) REFERENCES place (place_id),
 UNIQUE unique_user_place (user_id, place_id),
 CHECK (rating_score BETWEEN 0 AND 5)
)
 COMMENT = '별점';
 
-- -------------------------------------------------------------------------------------------------신고 테이블
DROP TABLE IF EXISTS report;

CREATE TABLE report
(
    report_id    INT NOT NULL AUTO_INCREMENT COMMENT '신고 id',
    created_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '신고 시간',
    report_contents    VARCHAR(255) NOT NULL COMMENT '신고 내용',
    report_approved    VARCHAR(255) NOT NULL DEFAULT 'NO' COMMENT '신고처리상태',
    user_id    INT NOT NULL COMMENT '피고인 id',
    report_type    VARCHAR(255) NOT NULL COMMENT '신고 구분',
    course_id    INT COMMENT '코스',
    place_id    INT COMMENT '장소',
    comment_id    INT COMMENT '댓글 id',
    message_id    INT COMMENT '메시지 id',
 PRIMARY KEY ( report_id ),
 CHECK (report_approved IN ('YES', 'NO')),
 CHECK (report_type IN ('COMMENT', 'COURSE', 'PLACE')),
 FOREIGN KEY (user_id) REFERENCES user (user_id),
 FOREIGN KEY (comment_id) REFERENCES comment (comment_id),
 FOREIGN KEY (course_id) REFERENCES course (course_id),
 FOREIGN KEY (message_id) REFERENCES message (message_id)
)
 COMMENT = '신고';
 
-- -------------------------------------------------------------------------------------------------저장 테이블
 DROP TABLE IF EXISTS save;
 
 CREATE TABLE save
(
    saved_id    INT NOT NULL AUTO_INCREMENT COMMENT '저장 id',
    category_id    INT NOT NULL COMMENT '저장 카테고리 id',
    user_id    INT NOT NULL COMMENT '저장 계정 id',
    save_type    VARCHAR(255) NOT NULL COMMENT '저장 구분',
    course_id    INT comment '코스 id',
    place_id    INT COMMENT '장소 id',
 PRIMARY KEY ( saved_id ),
 CHECK (save_type IN ('PLACE', 'COURSE')),
 FOREIGN KEY (user_id) REFERENCES user (user_id),
 FOREIGN KEY (place_id) REFERENCES place (place_id),
 FOREIGN KEY (course_id) REFERENCES course (course_id),
 FOREIGN KEY (category_id) REFERENCES save_category (saved_category_id)
 ON DELETE CASCADE
)
 COMMENT = '저장';
 
-- -------------------------------------------------------------------------------------------------테이블 확인
 SHOW TABLES;