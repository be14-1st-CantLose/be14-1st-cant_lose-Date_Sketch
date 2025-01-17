-- 매월 1일 규정에 따라 회원 등급을 업데이트											

CALL UpdateUserTiersByDate('2025.02.01');

-- 등급별 인원 조회 
-- SELECT u.tier_id,COUNT(*)
-- FROM test.`user` AS u
--GROUP BY tier_id;

DELIMITER //

CREATE PROCEDURE UpdateUserTiersByDate(IN input_date DATE)
BEGIN
    DECLARE target_month DATE;

    -- Calculate the target month (previous month of the input date)
    SET target_month = LAST_DAY(input_date - INTERVAL 1 MONTH);

    -- Create a temporary table to calculate likes by user
    CREATE TEMPORARY TABLE temp_user_likes AS
    SELECT 
        c.user_id, 
        SUM(c.likes) AS total_likes
    FROM 
        course c
    WHERE 
        DATE_FORMAT(c.created_at, '%Y-%m') = DATE_FORMAT(target_month, '%Y-%m')
    GROUP BY 
        c.user_id
    ORDER BY 
        total_likes DESC;

    -- Update tier_id for top users based on their ranking
    UPDATE user u
    JOIN (
        SELECT 
            user_id, 
            ROW_NUMBER() OVER (ORDER BY total_likes DESC) AS rank
        FROM temp_user_likes
    ) ranked_users
    ON u.user_id = ranked_users.user_id
    SET u.tier_id = 
        CASE 
            WHEN ranked_users.rank <= 10 THEN 4
            WHEN ranked_users.rank <= 50 THEN 3
            WHEN ranked_users.rank <= 100 THEN 2
            ELSE 1
        END;

    -- Reset tier_id to 1 for all users not in the temporary table
    UPDATE user
    LEFT JOIN temp_user_likes
    ON user.user_id = temp_user_likes.user_id
    SET tier_id = 1
    WHERE temp_user_likes.user_id IS NULL;

    -- Drop the temporary table
    DROP TEMPORARY TABLE temp_user_likes;

END //

DELIMITER ;


