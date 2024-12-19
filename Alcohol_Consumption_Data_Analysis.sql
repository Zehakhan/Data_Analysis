SELECT * FROM wine.`consumption of alcoholic beverages in russia 2017-2023`;


-- What is the total consumption of alcoholic beverages by region for each year?
SELECT 
    SUM(Total_alchol_cunsumption_pure_alchol), Region, Year
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
GROUP BY Region , Year;


-- What are the top 5 regions with the highest consumption of wine in 2023?
SELECT 
    Region, Sum(Wine) Highest_wine_Consumption
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
WHERE
    Year = 2023
GROUP BY Region
ORDER BY Highest_wine_consumption DESC
LIMIT 5;




-- What is the average consumption of alcoholic beverages (in liters per capita) by type for each year?

SELECT 
    ROUND(AVG(Consumption_of_alcholic_beverage_liter_per_capita) * 100,
            2),
    Type,
    Year
FROM
    wine.`consumption of alcoholic beverages 2017-2023 (pivot table)`
GROUP BY Type , Year;






-- How does the consumption of wine compare to beer in each region for the year 2022?
SELECT 
    Region, SUM(Wine) AS Total_Wine, SUM(Beer) AS Total_Beer
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
WHERE
    Year = 2022
GROUP BY Region;


-- What is the total consumption of vodka by region for each year?
SELECT 
    SUM(Vodka) AS vodka_consumption, Region, Year
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
GROUP BY Region , Year
ORDER BY Year;



-- Which region has the highest per capita consumption of alcoholic beverages in 2021?

SELECT 
    Region, sum(Total_alchol_cunsumption_pure_alchol) Highest_Alcohol_Consumption
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
WHERE
    Year = 2021
GROUP BY Region
ORDER BY Highest_Alcohol_Consumption DESC
LIMIT 1;




-- What is the trend of wine consumption over the years in the Moscow region?
SELECT 
    Year, 
    SUM(Wine) AS Total_Wine_Consumption
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
WHERE
    Region = 'Moscow'
GROUP BY 
    Year
ORDER BY 
    Year;
-- How many regions have a per capita consumption of wine greater than 5 liters in 2020?

SELECT 
    COUNT(Distinct Region)
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
WHERE
    Total_alchol_cunsumption_pure_alchol > '5.0'
        AND year = 2020
;

-- What is the average consumption of sparkling wine by region for the year 2023?

SELECT 
    AVG(Sparkling_wine), Region
FROM
    consumption_of_alcoholic_beverages_in_russia_2017_2023
WHERE
    year = 2023
GROUP BY Region;

