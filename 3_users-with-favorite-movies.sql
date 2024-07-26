SELECT u.user_id, u.username, JSON_ARRAYAGG(fm.movie_id) AS favorite_movie_ids FROM `movies-db`.user u
LEFT JOIN `movies-db`.favorite_movie fm
ON u.user_id = fm.user_id
GROUP BY u.user_id; 