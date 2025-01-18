UPDATE
       save
   SET category_id = 2
 WHERE user_id = 1 -- 1번 유저가
   AND save_id = 1; -- save_id가 1인
   AND place_id = 1; -- 1번 장소를