-- EXPLORATORY DATA ANALYSIS PROJECT

-- Step 1: Check the cleaned dataset
SELECT * 
FROM layoffs_staging2; 
-- Displays the cleaned layoffs dataset to gain insights.

-- Step 2: Find maximum laid-off employees in a day and highest percentage laid off
SELECT MAX(total_laid_off), MAX(percentage_laid_off) 
FROM layoffs_staging2; 
-- Maximum employees laid off in a day is over 12,000, and max layoff percentage is 1, indicating complete shutdowns.

-- Step 3: Find companies with 100% layoffs
SELECT * 
FROM layoffs_staging2 
WHERE percentage_laid_off = 1; 
-- Lists companies that laid off 100% of their workforce.

-- Step 4: Companies with the highest 100% layoffs by total count
SELECT * 
FROM layoffs_staging2 
WHERE percentage_laid_off = 1 
ORDER BY total_laid_off DESC; 
-- Sorts 100% layoff companies by total laid-off employees, with Katerra (Construction industry) having the highest.

-- Step 5: Companies with 100% layoffs by highest funds raised
SELECT * 
FROM layoffs_staging2 
WHERE percentage_laid_off = 1 
ORDER BY funds_raised_millions DESC; 
-- Finds the company with the highest funds raised before shutting down, e.g., Britishvolt raised $2.4 billion.

-- Step 6: Sum of total layoffs by company
SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY company 
ORDER BY 2 DESC; 
-- Sums total layoffs for each company and sorts in descending order.

-- Step 7: Check the date range of layoffs
SELECT MIN(`date`), MAX(`date`) 
FROM layoffs_staging2; 
-- Finds the range of layoffs, which occurred between 2020 and 2023.

-- Step 8: Sum of layoffs by industry
SELECT industry, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY industry 
ORDER BY 2 DESC; 
-- Finds which industries had the most layoffs, with consumer, retail, and transportation industries hit hardest.

-- Step 9: Layoffs by country
SELECT country, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY country 
ORDER BY 2 DESC; 
-- Lists the countries with the highest number of layoffs, led by the United States.

-- Step 10: Layoffs by date
SELECT `date`, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY `date` 
ORDER BY 1 DESC; 
-- Displays the total layoffs for each date, but this is not particularly relevant for analysis.

-- Step 11: Layoffs by year
SELECT YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY YEAR(`date`) 
ORDER BY 1 DESC; 
-- Analyzes layoffs year by year, showing 2022 as the peak year.

-- Step 12: Layoffs by stage of companies
SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY stage 
ORDER BY 1 DESC; 
-- Shows layoffs based on the company's stage (Series A to Post-IPO).

-- Step 13: Layoffs by stage, ordered by total laid-off employees
SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY stage 
ORDER BY 2 DESC; 
-- Post-IPO companies had the highest layoffs, followed by Series C, Series D, and other funding stages.

-- Step 14: Company-wise average layoff percentage
SELECT company, AVG(percentage_laid_off) 
FROM layoffs_staging2 
GROUP BY company 
ORDER BY 2 DESC; 
-- Displays average layoff percentage by company, though less relevant compared to total layoffs.

-- Step 15: Layoffs by month
SELECT SUBSTRING(`date`, 6, 2) AS `MONTH`, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY SUBSTRING(`date`, 6, 2); 
-- Displays monthly total layoffs (by month number).

-- Step 16: Layoffs by year and month
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off 
FROM layoffs_staging2 
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL 
GROUP BY `MONTH` 
ORDER BY 1; 
-- Summarizes total layoffs by year and month in ascending order.

-- Step 17: Calculate the rolling sum of layoffs month-wise
WITH rolling_total AS (
    SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off 
    FROM layoffs_staging2 
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL 
    GROUP BY SUBSTRING(`date`, 1, 7) 
    ORDER BY 1 ASC
) 
SELECT `MONTH`, total_off, SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total 
FROM rolling_total; 
-- Calculates a cumulative rolling sum of layoffs for each consecutive month.

-- Step 18: Total layoffs by company
SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY company 
ORDER BY 2 DESC; 
-- Lists companies by their total layoffs.

-- Step 19: Company-wise layoffs by date
SELECT company, `date`, SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY company, `date`; 
-- Shows total layoffs by company and date.

-- Step 20: Company-wise layoffs by year
SELECT company, YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2 
GROUP BY company, YEAR(`date`) 
ORDER BY 3 DESC; 
-- Displays company-wise layoffs, grouped by year.

-- Step 21: Rank companies by layoffs per year
WITH company_year (company, years, total_laid_off) AS (
    SELECT company, YEAR(`date`), SUM(total_laid_off) 
    FROM layoffs_staging2 
    GROUP BY company, YEAR(`date`)
), company_year_rank AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking 
    FROM company_year 
    WHERE years IS NOT NULL
) 
SELECT * 
FROM company_year_rank 
WHERE Ranking <= 5; 
-- Ranks the top 5 companies with the highest layoffs per year using a CTE.
