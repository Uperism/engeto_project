-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)

CREATE OR REPLACE TABLE t_dksp2 AS
SELECT
	dksp.date_from,
	dksp.category_code,
	cpc.name,
	round(dksp.average_value, 0) AS average_price,
	cpc.price_unit 
FROM t_daniel_kadar_project_sql_primary_final dksp
LEFT JOIN czechia_price_category cpc 
	ON cpc.code = dksp.category_code 
	WHERE dksp.date_from IS NOT NULL
GROUP BY dksp.date_from, dksp.category_code;  

SELECT 
	dksp.category_code,
	dksp2.name,
	dksp.date_from,
	ROUND(dksp.average_value, 0) AS average_value,
	dksp2.date_from AS previous_year,
	dksp2.average_price AS previous_year_price,
	FORMAT((dksp.average_value / dksp2.average_price - 1) * 100, 2) AS year_on_year_percentage_change
FROM t_daniel_kadar_project_sql_primary_final dksp
LEFT JOIN t_dksp2 dksp2
	ON dksp2.date_from + 1 = dksp.date_from 
	AND dksp2.category_code = dksp.category_code 
WHERE dksp2.date_from IS NOT NULL 
GROUP BY dksp.category_code, dksp.date_from;
