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

CREATE OR REPLACE TABLE t_dksp2 -- pomocná tabulka
SELECT
	cp.category_code,
	cp.region_code,
	year(cp.date_from) AS 'date_from',
	AVG(cp.value) AS average_value
FROM czechia_price cp
GROUP BY cp.region_code, cp.category_code, year(cp.date_from);

CREATE OR REPLACE TABLE t_daniel_kadar_project_sql_primary_final
SELECT
	cpay.value AS payroll_value,
	cpay.payroll_year,
	cpay.industry_branch_code,
	cpay.value_type_code,
	cpay.unit_code,
	cpay.calculation_code,
	dksp2.category_code,
	dksp2.region_code,
	dksp2.date_from,
	dksp2.average_value
FROM czechia_payroll cpay
LEFT JOIN t_dksp2 AS dksp2
	ON dksp2.date_from = cpay.payroll_year;








































