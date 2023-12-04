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
- A: Jak je patrné z dat získaných z dotazu dostupných v souboru "1) first question.sql", mzdy v České republice napříč odvětvími v letech 2006 - 2018 rostou i klesají. Největší procentuální pokles v mzdách oproti předchozímu roku byl zaznamenán v následujících odvětvích:

**Peněžnictví a pojišťovnictví: -16,11 %**
**Výroba a rozvod elektřiny, plynu, tepla a klimatizace vzduchu: -13,04 %**
**Kulturní, zábavní a rekreační činnosti: -6,53 %**
Naopak největší nárůst mezd byl zaznamenán v následujících odvětvích:

**V roce 2008 v odvětví Těžba a dobývání: 16,64 %**
**V roce 2009 v odvětví Výroba a rozvod elektřiny, plynu, tepla a klimatizace vzduchu: 16,49 %**
**V roce 2008 v odvětví Peněžnictví a pojišťovnictví: 13,57 %**
Pravděpodobně výrazný pokles mezd nastal v letech 2012-2013, což může být způsobeno ekonomickou krizí.

K tomuto závěru jsem došel spojením tabulek czechia_payroll a czechia_price do mé hlavní tabulky, ze které jsem následně odvodil tento dotaz.


***Druhá otázka***
- Q: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- A: Dostupná data pro ceny chleba a mléka jsou v letech 2006 až 2008, proto v tomto období porovnávam ceny s průměrnou hrubou mzdou. V roce 2006 bylo možné za průměrnou mzdu zakoupit 1494 kg chleba a 1492 litrů mléka. V roce 2018 bylo možné zakoupit za průměrnou            hrubou mzdu 1359 kg chleba a 1725 litrů mléka. Je tedy zřejmé, že v průběhu let je nákup chleba výrazě dražší vůči průměrně hrubé mzdě, než je tomu u mléka, kde cena zůstala takčka neměnná. 

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
