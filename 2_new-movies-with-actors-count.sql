SELECT movie.*, COUNT(actor.person_id) AS actors_count
FROM (
	SELECT m.movie_id, m.title
	FROM `movies-db`.movie m
	WHERE EXTRACT(YEAR FROM m.release_date) > YEAR(CURRENT_TIMESTAMP) - 5
) as movie
LEFT JOIN `movies-db`.movie_actor actor
ON movie.movie_id = actor.movie_id
GROUP BY m.movie_id 