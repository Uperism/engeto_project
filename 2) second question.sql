-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
	dksp.payroll_year AS year,
	round(avg(dksp.payroll_value),0) AS average_salary,
	cpc.name, 
	round (dksp.average_value, 0) AS average_price_CZK,
	round(avg(dksp.payroll_value)/dksp.average_value,0) AS amount,
	cpc.price_unit
FROM t_daniel_kadar_project_sql_primary_final dksp
LEFT JOIN czechia_price_category cpc 
	ON cpc.code = dksp.category_code 
WHERE dksp.value_type_code = 5958
	AND dksp.calculation_code = 200
	AND dksp.category_code IN (114201, 111301)
	AND dksp.payroll_year  IN (2006, 2018)
GROUP BY dksp.payroll_year, dksp.category_code;
