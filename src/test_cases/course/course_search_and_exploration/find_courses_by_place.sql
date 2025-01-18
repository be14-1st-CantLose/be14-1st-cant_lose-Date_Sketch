-- 특정 장소가 포함된 코스 조회
SELECT
        c.*
FROM course c
         JOIN course_locations cl ON c.course_id = cl.course_id -- 코스-장소 연결
WHERE cl.place_id = 3; -- 특정 장소 ID