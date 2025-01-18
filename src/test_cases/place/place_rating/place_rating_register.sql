USE test;
select * from rating;
select * from place where place_id = 1;
-- 장소 별점 매기기
INSERT
  INTO rating
(
  rating_score
, user_id
, place_id
) VALUES
(
  4
, 3
, 1
);

INSERT
INTO rating
(
  rating_score
, user_id
, place_id
)
VALUES
(
  5
, 5
, 1
);