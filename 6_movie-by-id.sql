WITH movie_id_1 AS (
	SELECT *
	FROM `movies-db`.movie m
	WHERE m.movie_id = 1
)

SELECT m.movie_id AS id, m.title, m.release_date, m.duration, md.description,
	JSON_OBJECT('id', f.file_id, 'name', f.name, 'mime_type', f.mime_type, 'key', f.key, 'url', f.url) AS poster,
	JSON_OBJECT('id', d.person_id, 'first_name', d.first_name, 'last_name', d.last_name,
	'photo', JSON_OBJECT('id', df.file_id, 'name', df.name, 'mime_type', df.mime_type, 'key', df.key, 'url', df.url)) AS director,
	ma.actors, mg.genres 
FROM movie_id_1 AS m
LEFT JOIN `movies-db`.movie_detail md
ON m.movie_id = md.movie_id
-- poster
LEFT JOIN `movies-db`.file f
ON m.poster_id = f.file_id
-- director
LEFT JOIN `movies-db`.person d
ON m.director_id = d.person_id
LEFT JOIN `movies-db`.file df
ON d.main_photo_id = df.file_id
-- actors
LEFT JOIN (
	SELECT ma.movie_id AS id,
		JSON_ARRAYAGG(JSON_OBJECT('id', ap.person_id, 'first_name', ap.first_name, 'last_name', ap.last_name,
        'photo', JSON_OBJECT('id', af.file_id, 'name', af.name, 'mime_type', af.mime_type, 'key', af.key, 'url', af.url))) as actors
    FROM movie_id_1 AS movie
    LEFT JOIN `movies-db`.movie_actor ma
    ON movie.movie_id = ma.movie_id
    LEFT JOIN `movies-db`.person ap
	ON ma.person_id = ap.person_id
	LEFT JOIN `movies-db`.file af
	ON ap.main_photo_id = af.file_id
    GROUP BY movie.movie_id
) ma
ON m.movie_id = ma.id
-- genre
LEFT JOIN (
	SELECT mg.movie_id AS id, JSON_ARRAYAGG(JSON_OBJECT('id', g.genre_id, 'name', g.name)) as genres
	FROM movie_id_1 AS movie
	LEFT JOIN `movies-db`.movie_genre mg
    ON movie.movie_id = mg.movie_id
    LEFT JOIN `movies-db`.genre g
	ON mg.genre_id = g.genre_id
    GROUP BY movie.movie_id
) mg
ON m.movie_id = mg.id;