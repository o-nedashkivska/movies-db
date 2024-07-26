SELECT movie.*, COUNT(actor.person_id) AS actors_count
FROM (
	SELECT m.movie_id AS id, m.title
	FROM `movies-db`.movie m
	WHERE EXTRACT(YEAR FROM m.release_date) > YEAR(CURRENT_TIMESTAMP) - 5
) movie
LEFT JOIN `movies-db`.movie_actor actor
ON movie.id = actor.movie_id
GROUP BY movie.id;