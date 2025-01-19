-- 유저가 코스나 댓글에 좋아요를 누르면 좋아요 테이블에 insert. 
-- 이후 트리거가 발동하여 코스 테이블의 좋아요 수, 댓글 테이블의 좋아요 수를 udpate.
delimiter //

CREATE OR REPLACE TRIGGER update_likes_count 
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
