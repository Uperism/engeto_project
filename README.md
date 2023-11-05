# Zadání projektu: Zpracování dat týkajících se platů a cen potravin za použití jazyka SQL.
Na pracovním oddělení firmy, která se stará o informace o tom, jak lidé žijí, máte úkol zjistit, jestli si lidé mohou snadno koupit základní jídlo. Tví kolegové už vymysleli otázky, na které chceme najít odpovědi. Těmto odpovědím budeme věřit a budeme je ukazovat na nadcházející konferenci, která se zaměřuje na tuto problematiku.

Potřebujeme udělat seznam s čísly, které ukáže, jak se mění cena jídla a kolik lidé vydělávají, když uplyne určitý čas.

Abychom to měli jasnější, potřebujeme také napsat, kolik peněz vydělají v jiných evropských zemích a jak je tam chudoba a bohatství.

## Vstupní datové sady pro získání podkladu:
### Primární tabulky
- *czechia_payroll* – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

- *czechia_price* – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

### Číselníky sdílených informací o ČR
- *czechia_payroll_calculation* – Číselník kalkulací v tabulce mezd.

- *czechia_payroll_industry_branch* – Číselník odvětví v tabulce mezd.

- *czechia_payroll_unit* – Číselník jednotek hodnot v tabulce mezd.

- *czechia_payroll_value_type* – Číselník typů hodnot v tabulce mezd.

- *czechia_price_category** – Číselník kategorií potravin, které se vyskytují v našem přehledu.



 **Pro zodpovězení výzkumných otázek jsem vytvořil dvě tabulky, které budou sloužit jako základní zdroj dat**
- **t_daniel_kadar_project_SQL_primary_final**: pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky.

-  **t_daniel_kadar_project_SQL_secondary_final**: pro dodatečná data o dalších evropských státech

## Výzkumné otázky
***První otázka***
- Q: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
- A: Jak můžeme vidět z dat, která vychází z dotazu dostupných v souboru "1) first question.sql", tak mzdy v České republice napříč odvětvími v letech 2006 - 2018 klesají, ale rostou. Největší procentuální propad ve mzdách, oproti předchozímu roku, měli odvětví všechny v roce 2013
***• Peněžnictví a pojišťovnictví -16,11 %**
***• Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu -13,04 %**
***• Kulturní, zábavní a rekreační činnosti - 6,53 %**

Zatímco největší nárůst měli tato odvětví:
V roce 2008 ***•Těžba a dobývání 16,64 %**.
V roce 2009 ***•Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu 16,49 %**.
V roce 2008 ***•Peněžnictví a pojišťovnictví 13,57 %**.

Výrazní pokles mezd měla pravděpodobně ekonomická krize v letech 2012-2013.

K tomuto závěru jsem přišel tak, že jsem spojil tabulky czechia_payroll a czechia_price do mé hlavní tabulky, ze které jsem následně rozvedl dotaz.


***Druhá otázka***
- Q: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- A:

***Třetí otázka***
- Q: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
- A:

***Čtvrtá otázka***
- Q: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
- A: 

***Pátá otázka***
- Q: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem? 
- A: 


## Výstup a závěr projektu
?
?
?
