-- 주소 세분화 성능 테스트

-- 유저 생성
INSERT INTO user (
    user_email, 
    user_pwd, 
    user_name, 
    user_phone, 
    user_nickname, 
    user_gender, 
    user_status, 
    user_suspension_at, 
    user_type, 
    is_deleted, 
    tier_id
) 
VALUES (
    'testuser@example.com', 
    'hashed_password', 
    'Test User', 
    '010-1234-5678', 
    'testnickname', 
    'MALE', 
    'PUBLIC', 
    NULL, 
    'COMMON', 
    FALSE, 
    1
);

SELECT * FROM user;

-- 주소 통합 테이블 생성
DROP TABLE if exists place2;

CREATE TABLE place2
(
    place_id    INT NOT NULL AUTO_INCREMENT COMMENT '장소 id',
    place_name    VARCHAR(255) NOT NULL COMMENT '장소 이름',
    addr    VARCHAR(255) NOT NULL COMMENT '주소',
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
 UNIQUE (place_name, addr)
)
 COMMENT = '장소';
 
 
SELECT * FROM place;
SELECT * FROM place2;



-- 데이터 넣기
DELIMITER //

-- 프로시저 생성
CREATE PROCEDURE InsertTestData()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE gu_index INT DEFAULT 1;
    DECLARE addr_gu_list VARCHAR(255) DEFAULT '종로구,중구,용산구,성동구,광진구,동대문구,중랑구,성북구,강북구,도봉구,노원구,은평구,서대문구,마포구,양천구,강서구,구로구,금천구,영등포구,동작구,관악구,서초구,강남구,송파구,강동구';
    DECLARE gu_array TEXT;
    SET gu_array = addr_gu_list;

    WHILE i <= 1000000 DO
        SET gu_index = (i - 1) % 25 + 1; -- 1~25 반복
        INSERT INTO place (
            place_name, addr_gu, addr_detail, phone_number, homepage, operation_hours, link, is_verified, rating_avg, rating_count, user_id
        ) VALUES (
            CONCAT('Place ', i), -- place_name
            SUBSTRING_INDEX(SUBSTRING_INDEX(gu_array, ',', gu_index), ',', -1), -- addr_gu
            CONCAT('Detail ', i), -- addr_detail
            CONCAT('010-', LPAD(FLOOR(RAND() * 10000), 4, '0'), '-', LPAD(FLOOR(RAND() * 10000), 4, '0')), -- phone_number
            CONCAT('http://homepage', i, '.com'), -- homepage
            CONCAT('09:00 ~ 18:00'), -- operation_hours
            CONCAT('http://link', i, '.com'), -- link
            IF(i % 2 = 0, 'YES', 'NO'), -- is_verified
            ROUND(RAND() * 5, 2), -- rating_avg
            FLOOR(RAND() * 100), -- rating_count
            1 -- user_id
        );

        INSERT INTO place2 (
            place_name, addr, phone_number, homepage, operation_hours, link, is_verified, rating_avg, rating_count, user_id
        ) VALUES (
            CONCAT('Place ', i), -- place_name
            CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(gu_array, ',', gu_index), ',', -1), ' ', 'Detail ', i), -- addr (addr_gu + addr_detail)
            CONCAT('010-', LPAD(FLOOR(RAND() * 10000), 4, '0'), '-', LPAD(FLOOR(RAND() * 10000), 4, '0')), -- phone_number
            CONCAT('http://homepage', i, '.com'), -- homepage
            CONCAT('09:00 ~ 18:00'), -- operation_hours
            CONCAT('http://link', i, '.com'), -- link
            IF(i % 2 = 0, 'YES', 'NO'), -- is_verified
            ROUND(RAND() * 5, 2), -- rating_avg
            FLOOR(RAND() * 100), -- rating_count
            1 -- user_id
        );

        SET i = i + 1;
    END WHILE;
END;
//

DELIMITER ;

-- 프로시저 실행
CALL InsertTestData();

-- 성능 테스트
SET @start_time1 = NOW(6);
SELECT * FROM place WHERE addr_gu = '종로구' AND addr_detail LIKE '%Detail 999976%';
SELECT TIMEDIFF(NOW(6), @start_time1);

SET @start_time2 = NOW(6);
SELECT * FROM place2 WHERE addr LIKE '%종로구 Dtail 999976%';
SELECT TIMEDIFF(NOW(6), @start_time2);



-- 100번씩 테스트
DROP PROCEDURE IF EXISTS CompareQueryPerformance;
DROP TABLE if EXISTS execution_times;

DELIMITER $$

CREATE PROCEDURE CompareQueryPerformance()
BEGIN
    -- 실행 결과 저장을 위한 임시 테이블 생성
    CREATE TEMPORARY TABLE execution_summary (
        query_type VARCHAR(10),
        executions INT,
        avg_execution_time DECIMAL(10, 6),
        min_execution_time DECIMAL(10, 6),
        max_execution_time DECIMAL(10, 6)
    );

    -- 첫 번째 쿼리 반복 실행
    CREATE TEMPORARY TABLE temp_times (execution_time DECIMAL(10, 6));
    SET @i = 0;
    WHILE @i < 100 DO
        SET @start_time = NOW(6);
        -- 장소 데이터를 출력하지 않고 실행
        SELECT COUNT(*) INTO @dummy FROM place WHERE addr_gu = '종로구' AND addr_detail LIKE '%Detail 999976%';
        INSERT INTO temp_times (execution_time)
        VALUES (TIMESTAMPDIFF(MICROSECOND, @start_time, NOW(6)) / 1000000);
        SET @i = @i + 1;
    END WHILE;
    -- 첫 번째 쿼리 요약 결과 저장
    INSERT INTO execution_summary
    SELECT 
        'place' AS query_type,
        COUNT(*) AS executions,
        AVG(execution_time) AS avg_execution_time,
        MIN(execution_time) AS min_execution_time,
        MAX(execution_time) AS max_execution_time
    FROM temp_times;
    DROP TEMPORARY TABLE temp_times;

    -- 두 번째 쿼리 반복 실행
    CREATE TEMPORARY TABLE temp_times (execution_time DECIMAL(10, 6));
    SET @i = 0;
    WHILE @i < 100 DO
        SET @start_time = NOW(6);
        -- 장소 데이터를 출력하지 않고 실행
        SELECT COUNT(*) INTO @dummy FROM place2 WHERE addr LIKE '%종로구 Dtail 999976%';
        INSERT INTO temp_times (execution_time)
        VALUES (TIMESTAMPDIFF(MICROSECOND, @start_time, NOW(6)) / 1000000);
        SET @i = @i + 1;
    END WHILE;
    -- 두 번째 쿼리 요약 결과 저장
    INSERT INTO execution_summary
    SELECT 
        'place2' AS query_type,
        COUNT(*) AS executions,
        AVG(execution_time) AS avg_execution_time,
        MIN(execution_time) AS min_execution_time,
        MAX(execution_time) AS max_execution_time
    FROM temp_times;
    DROP TEMPORARY TABLE temp_times;

    -- 최종 요약 결과 출력
    SELECT * FROM execution_summary;

    -- 테스트 종료 후 임시 테이블 삭제
    DROP TEMPORARY TABLE execution_summary;
END$$

DELIMITER ;

CALL CompareQueryPerformance();