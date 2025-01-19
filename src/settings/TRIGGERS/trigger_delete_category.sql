DROP TRIGGER IF EXISTS delete_user_saved_data;

DELIMITER //

CREATE TRIGGER delete_user_saved_data
AFTER DELETE ON save_category
FOR EACH ROW
BEGIN
    DELETE FROM save 
    WHERE category_id = OLD.saved_category_id
    AND user_id = OLD.user_id;
END//

DELIMITER ;