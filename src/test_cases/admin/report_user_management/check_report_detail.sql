-- 신고 상세 조회
SELECT
       a.report_id
      , a.created_at
      , a.report_contents
      , a.report_approved
      , a.reported_user_id
      , a.report_user_id
      , a.report_type
     , CASE 
            WHEN a.report_type = 'PLACE' THEN a.place_id
            ELSE NULL
        END AS place_id
     , CASE 
            WHEN a.report_type = 'COURSE' THEN a.course_id
            ELSE NULL
        END AS course_id
     , CASE 
            WHEN a.report_type = 'COMMENT' THEN a.comment_id
            ELSE NULL
        END AS comment_id
     , CASE 
            WHEN a.report_type = 'MESSAGE' THEN a.message_id
            ELSE NULL
        END AS message_id
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
     , c.user_nickname AS reported_user_nickname
FROM 
    report a
LEFT JOIN 
    place b ON a.place_id = b.place_id
LEFT JOIN 
    user c ON a.reported_user_id = c.user_id
WHERE
    a.report_id = 1;



