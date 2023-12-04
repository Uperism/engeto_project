-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
	dksp.payroll_year AS year,
	round(avg(dksp.salary), 0) AS average_earnings,
	cpc.name AS name_of_item, 
	round(dksp.price, 0) AS average_price_CZK,
	round(avg(dksp.salary)/dksp.price, 0) AS amount,
	cpc.price_unit AS units 
FROM t_daniel_kadar_project_SQL_primary_final dksp
LEFT JOIN czechia_price_category cpc
	ON cpc.code = dksp.item_code
WHERE dksp.value_type_code = 5958
	AND dksp.payroll_year IN (2006, 2018)
	AND dksp.item_code IN (114201, 111301)
	AND dksp.calculation_code = 200
 GROUP BY dksp.payroll_year, dksp.item_code;