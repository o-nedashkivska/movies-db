SELECT m.director_id AS director_id,
	CONCAT(p.first_name, ' ', p.last_name) AS director_name,
    ROUND(AVG(m.budget),2) AS average_budget
FROM `movies-db`.movie m
LEFT JOIN `movies-db`.person p
ON m.director_id = p.person_id
GROUP BY m.director_id;