-- 코스 상세조회
SELECT
    c.course_name,                       						 -- 코스 이름
    c.course_comment,                     					 -- 코스 설명
    c.course_visited_date,                					 -- 코스 방문 날짜
    c.course_visited_weather,             					 -- 코스 방문 날씨
    c.created_at,                         					 -- 코스 생성 날짜
    c.updated_at,                         					 -- 코스 수정 날짜
    c.likes,                            					 -- 코스 좋아요 수
    u.user_nickname AS creator_nickname,  					 -- 작성자 닉네임
    cl.place_seq,                        					 -- 장소 순서
    p.place_name,                         					 -- 장소 이름
    p.addr_gu,                            					 -- 장소 주소 (구)
    ROUND(AVG(r.rating_score), 1) AS avg_rating, 			 -- 장소 평균 별점 (소수점 1자리)

    -- 댓글 정보 추가
    com.comment_contents,                   -- 댓글 내용
    com.created_at AS comment_created_at,   -- 댓글 생성 시간
    com.likes AS comment_likes,             -- 댓글 좋아요 수
    com.comment_type AS comment_type,       -- 댓글 구분 (코스, 장소, 댓글)

    -- 대댓글 정보 (댓글에 대한 대댓글)
    rec.comment_contents AS recomment_contents, -- 대댓글 내용
    rec.created_at AS recomment_created_at, -- 대댓글 생성 시간
    rec.likes AS recomment_likes            -- 대댓글 좋아요 수

      FROM course c
         JOIN course_locations cl ON c.course_id = cl.course_id    -- 코스-장소 연결
         JOIN place p ON cl.place_id = p.place_id                  -- 장소 정보 가져오기
         JOIN user u ON c.user_id = u.user_id                      -- 작성자 정보 가져오기
         LEFT JOIN rating r ON p.place_id = r.place_id             -- 장소의 별점 정보 결합
         LEFT JOIN comment com ON c.course_id = com.course_id AND com.is_deleted = FALSE -- 댓글 연결 (삭제되지 않은 댓글만)
         LEFT JOIN comment rec ON com.comment_id = rec.recomment_id AND rec.is_deleted = FALSE -- 대댓글 연결 (삭제되지 않은 대댓글만)
WHERE c.course_id = 2                                     -- 특정 코스 ID
GROUP BY c.course_id, cl.place_seq, com.comment_id, rec.comment_id -- 코스 및 장소 순서별로 그룹화
ORDER BY cl.place_seq, com.created_at, rec.created_at;    -- 장소 순서 및 댓글/대댓글 생성 시간순으로 정렬