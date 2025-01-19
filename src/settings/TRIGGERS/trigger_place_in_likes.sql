DELIMITER //

CREATE OR REPLACE TRIGGER update_place_rating_after_insert
AFTER INSERT ON rating
FOR EACH ROW
BEGIN
    DECLARE new_avg_rating DECIMAL(10, 2);
    DECLARE new_rating_count INT;

    -- 별점 평균과 카운트 계산
SELECT
    AVG(rating_score),
    COUNT(*)
INTO
    new_avg_rating,
    new_rating_count
FROM
    rating
WHERE
    place_id = NEW.place_id;

-- place 테이블 업데이트
UPDATE place
SET
    rating_avg = IFNULL(new_avg_rating, 0.00),
    rating_count = IFNULL(new_rating_count, 0)
WHERE
    place_id = NEW.place_id;
END;
//
CREATE OR REPLACE TRIGGER update_place_rating_after_update
AFTER UPDATE ON rating
                 FOR EACH ROW
BEGIN
    DECLARE new_avg_rating DECIMAL(10, 2);

    -- 별점 평균만 계산
SELECT
    AVG(rating_score)
INTO
    new_avg_rating
FROM
    rating
WHERE
    place_id = NEW.place_id;

-- place 테이블 업데이트
UPDATE place
SET
    rating_avg = IFNULL(new_avg_rating, 0.00)
WHERE
    place_id = NEW.place_id;
END;
//

DELIMITER ;