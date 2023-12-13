CREATE OR REPLACE TABLE t_daniel_kadar_project_SQL_secondary_final AS
SELECT 
	c.continent,
	c.country,
	e.GDP,
	e.gini,
	e.population,
	e.'year'
FROM countries c 
LEFT JOIN economies e 
	ON e.country = c.country 
WHERE e.year >= 2000 
	AND e.year <= 2021
	AND c.continent = 'Europe'
ORDER BY e.year;
