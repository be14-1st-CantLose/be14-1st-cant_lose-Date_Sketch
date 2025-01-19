-- 회원 가입 시 기본 카테고리 생성

DELIMITER // 

CREATE OR REPLACE TRIGGER after_insert_user
    AFTER INSERT
    ON user
    FOR EACH ROW
BEGIN
     INSERT INTO save_category
     (saved_category_name, user_id)
     VALUES ('기본', NEW.user_id);
END//

DELIMITER ;
INSERT INTO user 
    (user_email, user_pwd, user_name, user_phone, user_nickname, user_gender, user_status) 
VALUES 
    ('abc9541@gmail.com', '1234', '이준규', '010-1234-1234', '준규준규', 'MALE', 'PUBLIC');
