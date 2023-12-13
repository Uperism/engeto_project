-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
SELECT 
	dksp.payroll_year AS year,
	cpib.name AS industry_name,
	MAX(dksp.payroll_value) AS current_year_salary,
	ROUND(AVG(dksp.payroll_value), 0) AS average_salary,
	LAG(MAX(dksp.payroll_value)) OVER (PARTITION BY cpib.name ORDER BY dksp.payroll_year) AS previous_year_salary,
	ROUND(100 * (MAX(dksp.payroll_value) - LAG(MAX(dksp.payroll_value)) OVER (PARTITION BY cpib.name ORDER BY dksp.payroll_year)) / LAG(MAX(dksp.payroll_value)) OVER (PARTITION BY cpib.name ORDER BY dksp.payroll_year), 2) AS previous_year_percent_change,
	CASE
		WHEN MAX(dksp.payroll_value) > LAG(MAX(dksp.payroll_value)) OVER (PARTITION BY cpib.name ORDER BY dksp.payroll_year) THEN 'Increase'
		WHEN MAX(dksp.payroll_value) < LAG(MAX(dksp.payroll_value)) OVER (PARTITION BY cpib.name ORDER BY dksp.payroll_year) THEN 'Decrease'
		ELSE 'Stable - no change'
	END AS change_type
FROM t_daniel_kadar_project_SQL_primary_final dksp
LEFT JOIN czechia_payroll_industry_branch cpib
	ON cpib.code = dksp.industry_branch_code
WHERE dksp.industry_branch_code IS NOT NULL
	AND dksp.unit_code = '200'
	AND dksp.value_type_code = '5958'
GROUP BY cpib.name, dksp.payroll_year;
