SELECT mc.person_id AS id, p.first_name, p.last_name, 
    SUM(m.budget) AS total_budget
FROM `movies-db`.movie_actor mc
LEFT JOIN `movies-db`.person p
ON mc.person_id = p.person_id
LEFT JOIN `movies-db`.movie m
ON mc.movie_id = m.movie_id
GROUP BY mc.person_id;