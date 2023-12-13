-- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

CREATE OR REPLACE TABLE t_dksp2 AS -- pomocná tabulka jedna
SELECT
	dksp.date_from AS annual_date,
	round(avg(dksp.average_value),0) AS avg_price,
	round(avg(dksp.payroll_value),0) AS avg_salary
FROM t_daniel_kadar_project_sql_primary_final dksp
	WHERE dksp.date_from IS NOT NULL
	AND dksp.calculation_code = 200
	AND dksp.value_type_code = 5958
GROUP BY dksp.date_from;  

CREATE OR REPLACE TABLE t_dksp3 AS -- pomocná tabulka dva
SELECT
	dksp.date_from AS annual_date,
	round(avg(dksp.average_value),0) AS avg_price,
	round(avg(dksp.payroll_value),0) AS avg_salary
FROM t_daniel_kadar_project_sql_primary_final dksp
	WHERE dksp.date_from IS NOT NULL
	AND dksp.calculation_code = 200
	AND dksp.value_type_code = 5958
GROUP BY dksp.date_from; 

SELECT 
	dksp2.annual_date,
	dksp2.avg_price AS average_price_in_CZK, 
	dksp2.avg_salary AS average_salary_in_CZK, 
	dksp3.annual_date AS previous_year,
	dksp3.avg_price AS previous_annual_date,
	dksp3.avg_salary AS previous_year_averae_salary_CZK,
	ROUND(dksp2.avg_price / dksp3.avg_price - 1, 2) * 100 AS annual_price_variation,
	ROUND(dksp2.avg_salary / dksp3.avg_salary - 1, 2) * 100 AS annual_salary_variation
FROM t_dksp2 dksp2
LEFT JOIN t_dksp3 dksp3
	ON dksp3.annual_date + 1 = dksp2.annual_date
WHERE dksp3.annual_date IS NOT NULL
GROUP BY dksp2.annual_date  
ORDER BY dksp2.annual_date;
