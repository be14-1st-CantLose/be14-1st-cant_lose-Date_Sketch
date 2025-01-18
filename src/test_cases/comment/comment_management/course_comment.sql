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