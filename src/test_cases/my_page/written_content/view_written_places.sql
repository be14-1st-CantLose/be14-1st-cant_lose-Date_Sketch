-- 작성한 장소 조회
-- 회원 1이 작성한 장소 목록
SELECT place_id, place_name, addr_gu, addr_detail, phone_number, homepage, operation_hours, link, is_verified, rating_avg, rating_count, user_id
FROM place
WHERE user_id = 2;