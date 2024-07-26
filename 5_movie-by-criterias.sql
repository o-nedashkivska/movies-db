WITH action_or_drama AS (
	SELECT movie_genre.movie_id
    FROM (
		SELECT genre.genre_id
        FROM `movies-db`.genre genre
        WHERE genre.name = 'action' OR genre.name = 'drama'
    ) as genre
	LEFT JOIN `movies-db`.movie_genre movie_genre
	ON movie_genre.genre_id = genre.genre_id
)

SELECT m.movie_id, m.title, m.release_date, m.duration, md.description,
JSON_OBJECT('id', f.file_id, 'name', f.name, 'mime_type', f.mime_type, 'key', f.key, 'url', f.url) AS poster,
JSON_OBJECT('id', p.person_id, 'first_name', p.first_name, 'last_name', p.last_name) AS director
FROM (
	SELECT *
	FROM `movies-db`.movie m
	WHERE m.country_id = 1
		AND EXTRACT(YEAR FROM m.release_date) >= 2022
		AND m.duration >= '02:15:00'
		AND m.movie_id IN (SELECT * FROM action_or_drama)
) m
LEFT JOIN `movies-db`.person p
ON m.director_id = p.person_id
LEFT JOIN `movies-db`.file f
ON m.poster_id = f.file_id
LEFT JOIN `movies-db`.movie_detail md
ON m.movie_id = md.movie_id
GROUP BY m.movie_id