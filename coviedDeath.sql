Select *
From PortofolioProject..covidDeath
Where continent is not null 
order by 3,4



 --Select Data that we are going to be starting with

select location,date,total_cases,new_cases,total_deaths,population

from PortofolioProject..covidDeath
order by 1,2

-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
SELECT 
    location,date,total_cases,total_deaths,
    (CAST(total_deaths AS float) / CAST(total_cases AS float)) * 100 AS death_percentage
FROM 
    PortofolioProject..covidDeath
Where location like '%states%'
order by 1,2

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

SELECT
    location,
	date,
    total_cases,
    population,
    (total_cases / population) * 100 AS infection_percentage
FROM
   PortofolioProject..covidDeath
   Where location like '%states%'
   order by 1,2

   -- Countries with Highest Infection Rate compared to Population

select
location,
population,
MAX(total_cases) as HighestInfectionCount,
Max((total_cases/population))*100 as PercentPopulationInfected
from PortofolioProject..covidDeath
Group by Location, Population
order by PercentPopulationInfected desc


--Countries with Highest Death Count per Population


SELECT
    location,
    MAX(total_deaths) AS total_deaths,
    MAX(population) AS population,
    (MAX(total_deaths) / MAX(population)) * 100 AS death_percentage
FROM
    PortofolioProject..covidDeath
WHERE
    population > 0
GROUP BY
    location
ORDER BY
    death_percentage DESC;

-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortofolioProject..covidDeath
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc

-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases,
SUM(cast(new_deaths as int)) as total_deaths,
SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortofolioProject..covidDeath
where continent is not null 
order by 1,2






