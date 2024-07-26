SELECT m.*, COUNT(a.person_id) AS actors_count
FROM (
	SELECT m.movie_id AS id, m.title
	FROM `movies-db`.movie m
	WHERE EXTRACT(YEAR FROM m.release_date) > YEAR(CURRENT_TIMESTAMP) - 5
) m
LEFT JOIN `movies-db`.movie_actor a
ON m.id = a.movie_id
GROUP BY m.id;