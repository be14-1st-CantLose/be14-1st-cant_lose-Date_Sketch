-- 저장한 장소 확인
-- 회원 2이 저장한 장소 목록
SELECT s.saved_id, s.user_id, p.place_name, p.addr_gu, p.addr_detail, p.phone_number, p.homepage, p.operation_hours, p.link, p.is_verified, p.rating_avg, p.rating_count, sc.saved_category_name
FROM save s
         JOIN place p ON s.place_id = p.place_id
         JOIN save_category sc ON s.category_id = sc.saved_category_id
WHERE s.user_id = 2 AND s.save_type = 'PLACE';