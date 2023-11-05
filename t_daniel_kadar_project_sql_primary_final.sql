-- Primární tabulky
SELECT *
FROM czechia_payroll cp ;

SELECT *
FROM czechia_payroll_calculation ;
	
SELECT *
FROM czechia_payroll_industry_branch;

SELECT *
FROM czechia_payroll_unit;

-- '5958' Průměrná hrubá mzda na zaměstnance
SELECT *
FROM czechia_payroll_value_type;

SELECT *
FROM czechia_price;

-- '114201' (Mléko polotučné pasterované) a '111301' (Chléb konzumní kmínový)	
SELECT *
FROM czechia_price_category;

-- Číselníky sdílených informací o ČR
SELECT *
FROM czechia_region;

SELECT *
FROM czechia_district;

-- Dodatečné tabulky:
SELECT *
FROM countries ;

SELECT *
FROM economies ;



CREATE TABLE IF NOT EXISTS t_daniel_kadar_project_SQL_primary_final_1
SELECT 
		cpay.value AS salary,
		cpay.value_type_code,
		cpay.unit_code,
		cpay.calculation_code,
		cpay.industry_branch_code,
		cpay.payroll_year,
		cp.value AS price,
		cp.category_code AS item_code, 
		DATE (cp.date_from) AS 'date_from',
		DATE (cp.date_to) AS 'date_to'
FROM czechia_payroll cpay
LEFT JOIN czechia_price cp 
	ON cpay.payroll_year = YEAR(cp.date_from)
WHERE cp.date_from IS NOT NULL 
ORDER BY cp.date_from ASC ;








































