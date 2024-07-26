SELECT person.person_id, CONCAT(person.first_name, ' ', person.last_name) as full_name, ROUND(AVG(movie.budget),2) as average_budget
FROM `movies-db`.movie movie
LEFT JOIN `movies-db`.person person
ON movie.director_id = person.person_id
GROUP BY person.person_id;