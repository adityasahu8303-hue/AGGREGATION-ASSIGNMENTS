Use world;
Select * from city;

Select * from country;

##Question 1 : Count how many cities are there in each 
SELECT co.Country_Name , COUNT(C.City_Name ) AS TotalCities
FROM City C
left join Country co
On co.Country_code = C.CountryCode
GROUP BY co.Country_Name;

##Question 2 : Display all continents having more than 30 countries.
Select Continent , Count(Country_Name) as total_country from Country 
group by Continent
Having total_country > 30;

## Question 3 : List regions whose total population exceeds 200 million.
Select Region, COuntry_pop From country 
where Country_pop > 200000000;
## OR 2^nd Method...
Select Region, Sum(Country_pop) As Total_pop
from Country
group by Region 
Having total_pop > 200000000;

## Question 4 : Find the top 5 continents by average GNP per country.
Select Continent , ROUND(Avg(GNP), 2) as average_gnp from country
group by Continent 
order by average_gnp DESC
LIMIT 5;

##Question 5 : Find the total number of official languages spoken in each continent.
SELECT c.Continent, COUNT(cl.Language) AS TotalOfficialLanguages
FROM Countries c
JOIN CountryLanguage cl
ON c.Country_code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

##Question 6 : Find the maximum and minimum GNP for each continent
Select Country_Name, Continent, Region ,
lag(GNP) Over (Order by GNP DESC) as Previous_Value,
GNP,
lead(GNP) Over (order by GNP DESC) as Next_VAlue
From country;

##Question 7 : Find the country with the highest average city population.
Select Country_Name , ROUND(Avg(Country_pop), 2) As AVG_CITY_POP
FROM COUNTRY
GROUP BY COUNTRY_NAME 
ORDER BY AVG_CITY_POP DESC
LIMIT 1 ;

## Question 8 : List continents where the average city population is greater than 200,000..
Select CO.Continent, Avg(C.City_pop) As Avg_City_Pop
from city C
JOIN Country CO
On C.countryCode = CO.Country_code
Group by CO.Continent
Having Avg_City_Pop > 200000;

##Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
select Continent, Sum(Country_pop) As total_pop, AVG(LifeExpectancy) as avg_life_expectancy
from country
group by Continent
order by avg_life_expectancy DESC;

## Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.
Select Continent , AVG(lifeExpectancy) as Avg_life_expectancy, SUM(Country_Pop) As Total_pop
from country
group by Continent
Having  Total_pop > 200000000
Order by avg_life_expectancy DESC
LIMIT 3;


