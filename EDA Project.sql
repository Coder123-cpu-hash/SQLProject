-- Exploratory Data Analysis

SELECT * 
FROM layoffs_staging2;

SELECT Max(total_laid_off), Max(percentage_laid_off)
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off= 1
ORDER BY funds_raised_millions
 DESC;
 
 SELECT COMPANY,SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY company
 order by 2 desc;
 
 SELECT Min(`date`),max(`date`)
FROM layoffs_staging2;

 
 SELECT industry ,SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY industry
 order by 2 desc;
 
 SELECT country ,SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY country
 order by 2 desc;
 
  SELECT YEAR(`date`) ,SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY YEAR(`date`)
 order by 1 desc;
 
 SELECT STAGE ,SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY stage
 order by 2 desc;
 
 select substring(`date`, 1,7) as `month`, sum(total_laid_off)
 from layoffs_staging2
 where substring(`date`, 1,7) is not null
 group by  `month`
 order by 1 asc;
 
 with rolling_total as
 (
 select substring(`date`, 1,7) as `month`, sum(total_laid_off) as total_off
 from layoffs_staging2
 where substring(`date`, 1,7) is not null
 group by  `month`
 order by 1 asc
 )
 select `month`,total_off, sum(total_off) over(order by `month`) as rolling_total
 from rolling_total;
 
 
 
 SELECT country ,SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY country
 order by 2 desc;


SELECT company ,year(`date`), SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY company,(`date`);
 
 with Company_year (company,years,total_laid_off)aS
 (
 SELECT company ,year(`date`), SUM(TOTAL_LAID_OFF)
 FROM layoffs_staging2
 GROUP BY company,(`date`)
 ), company_year_rank as
 (
 select * ,
 dense_rank() over(partition by years order by total_laid_off desc) as Ranking
 from company_year
 where years is not null
 )
 select * from
 company_year_rank
 where ranking <= 5;
 