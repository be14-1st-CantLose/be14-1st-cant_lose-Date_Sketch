-- 코스 상세 조회

-- 프로시저 생성
DROP PROCEDURE IF EXISTS GetCourseDetails;

DELIMITER $$

CREATE PROCEDURE GetCourseDetails(IN p_course_id INT)
BEGIN

-- 1) 코스,유저 정보 조회
SELECT
  	    a.course_id
  	  , a.course_name
  	  , a.course_scope
  	  , a.course_visited_date
  	  , a.likes
  	  , a.is_deleted
  	  , a.is_published
  	  , a.created_at
  	  , a.updated_at
  	  , a.user_id
  	  , b.user_nickname
  	  , b.user_gender
  FROM course a
  JOIN user b ON a.user_id = b.user_id
 WHERE course_id = p_course_id;

-- 2) 코스에 할당된 장소들 정보 조회
SELECT 
       a.course_id
     , a.place_id
     , a.place_seq
     , b.place_name
     , b.addr_gu
     , b.addr_detail
     , b.phone_number
     , b.homepage
     , b.operation_hours
     , b.link
     , b.is_verified
     , b.rating_avg
     , b.rating_count
     , b.user_id
  FROM course_locations a
  JOIN place b ON a.place_id = b.place_id
 WHERE a.course_id = p_course_id
 ORDER BY a.place_seq ASC;

-- 3) 코스에 달린 댓글 조회
SELECT
       a.comment_id
     , a.comment_contents
     , a.created_at
     , a.updated_at
     , a.is_deleted
     , a.likes
     , a.comment_type
     , a.recomment_id
     , b.user_nickname
     , b.user_id
  FROM comment a
  JOIN user b ON a.user_id = b.user_id
WHERE a.course_id = p_course_id
ORDER BY a.created_at DESC;

END$$

DELIMITER ;

-- 프로시저 호출
CALL GetCourseDetails(1);