delimiter //

CREATE OR REPLACE TRIGGER upate_likes_count 
    AFTER INSERT 
    ON likes
    FOR EACH ROW 

BEGIN 
    IF NEW.likes_type = 'COURSE' THEN 
        UPDATE course 
            SET likes = likes + 1
            WHERE course_id = NEW.course_id;
    ELSEIF NEW.likes_type = 'COMMENT' THEN 
        UPDATE comment 
            SET likes = likes + 1
            WHERE comment_id = NEW.comment_id;
    END IF;
END //

delimiter ;
