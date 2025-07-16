-- Data Cleaning

SELECT * 
FROM layoffs;

-- 1.Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Balues or Blank values
-- 4. Remove Any Columns or Rows

-- 1.Remove Duplicates
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * 
FROM layoffs_staging;

INSERT layoffs_staging
SELECT * 
FROM layoffs;


SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY COMPANY,INDUSTRY,TOTAL_LAID_OFF,PERCENTAGE_LAID_OFF,`DATE`) AS row_num
FROM layoffs_staging;


with duplicate_cte as
(
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY COMPANY,LOCATION,INDUSTRY,TOTAL_LAID_OFF,PERCENTAGE_LAID_OFF,`DATE`,STAGE,COUNTRY,funds_raised_millions) AS row_num
FROM layoffs_staging
)
select * 
from duplicate_cte
where row_num > 1;


SELECT * 
FROM layoffs_staging
where company ='CASPER';

with duplicate_cte as
(
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY COMPANY,LOCATION,INDUSTRY,TOTAL_LAID_OFF,PERCENTAGE_LAID_OFF,`DATE`,STAGE,COUNTRY,funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE
from duplicate_cte
where row_num > 1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



SELECT *  
FROM layoffs_staging2
WHERE ROW_NUM >1;


 INSERT INTO LAYOFFS_STAGING2
 SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY COMPANY,LOCATION,INDUSTRY,TOTAL_LAID_OFF,PERCENTAGE_LAID_OFF,`DATE`,STAGE,COUNTRY,funds_raised_millions) AS row_num
FROM layoffs_staging;

DELETE 
FROM layoffs_staging2
WHERE ROW_NUM >1;

SELECT *  
FROM layoffs_staging2
WHERE ROW_NUM >1;


-- 2. Standardize the Data

SELECT COMPANY, TRIM(COMPANY)
FROM layoffs_staging2;

UPDATE LAYOFFS_STAGING2
SET COMPANY  = TRIM(COMPANY);

SELECT * 
FROM layoffs_staging2
WHERE INDUSTRY LIKE 'CRYPTO%';

UPDATE LAYOFFS_STAGING2
SET INDUSTRY = 'Crypto'
WHERE INDUSTRY LIKE 'CRYPTO%';


SELECT  distinct country
FROM LAYOFFS_STAGING2
where country like 'United States.%' ;

UPDATE LAYOFFS_STAGING2
SET COUNTRY = 'United States'
WHERE country LIKE 'United States%'; 


SELECT `DATE` 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `DATE`  = str_to_date(`DATE`,'%m/%d/%Y');

SELECT * 
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `DATE` DATE;


-- 3. Null Balues or Blank values



UPDATE layoffs_staging2
SET INDUSTRY = null 
WHERE INDUSTRY = '';

SELECT *
FROM layoffs_staging2
WHERE INDUSTRY IS NULL
OR INDUSTRY = ''; 



SELECT * 
FROM layoffs_staging2 T1 
JOIN layoffs_staging2 T2
	ON T1.company = T2.company
    AND T1.location = T2.location
WHERE (T1.INDUSTRY IS NULL OR T1.industry = '')
AND T2.INDUSTRY IS NOT NULL;

UPDATE layoffs_staging2 T1 
JOIN layoffs_staging2 T2
	ON T1.company = T2.company
SET T1.INDUSTRY = T2.INDUSTRY
WHERE (T1.INDUSTRY IS NULL OR T1.industry = '')
AND T2.INDUSTRY IS NOT NULL;

SELECT *
FROM layoffs_staging2;

-- 4. Remove Any Columns'

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

delete 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

select * from layoffs_staging2;

alter table 
layoffs_staging2
drop column row_num











































 
