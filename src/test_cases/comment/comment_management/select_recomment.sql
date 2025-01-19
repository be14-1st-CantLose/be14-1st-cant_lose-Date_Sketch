SELECT
       a.comment_id,
       a.comment_contents,
       a.created_at,
       a.updated_at,
       a.is_deleted,
       a.likes,
       a.user_id,
       b.user_nickname
  FROM comment a
  JOIN user b ON a.user_id = b.user_id
 WHERE a.recomment_id = 1
 ORDER BY a.created_at ASC;