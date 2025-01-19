UPDATE
       save
   SET category_id = 2
 WHERE user_id = 2 -- 1번 유저가
   AND saved_id = 3 -- save_id가 1인
   AND place_id = 1; -- 1번 장소를

select * from save;