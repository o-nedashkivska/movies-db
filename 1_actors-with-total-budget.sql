SELECT actor.person_id, person.first_name, person.last_name, SUM(movie.budget) as total_budget
FROM `movies-db`.movie_actor actor
LEFT JOIN `movies-db`.person person
ON actor.person_id = person.person_id
LEFT JOIN `movies-db`.movie movie
ON actor.movie_id = movie.movie_id
GROUP BY actor.person_id