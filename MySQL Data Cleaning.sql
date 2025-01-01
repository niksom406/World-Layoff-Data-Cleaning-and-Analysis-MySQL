-- Data Cleaning 

SELECT * 
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data 
-- 3. Null Values or blank values
-- 4. Remove Any Columns 

CREATE TABLE layoffs_stagging 
LIKE layoffs;

SELECT *
FROM layoffs_stagging;

INSERT layoffs_stagging
SELECT * 
FROM layoffs;

-- 1. Identifying and removing duplicates

WITH duplicate_cte AS
(
	SELECT *, 
	ROW_NUMBER() OVER(
	PARTITION BY company,location,industry,total_laid_off, percentage_laid_off,
    `date`,stage,country,funds_raised_millions) AS row_num
	FROM layoffs_stagging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

SELECT * 
FROM layoffs_stagging
WHERE company = 'Casper';

CREATE TABLE `layoffs_stagging2` (
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
FROM layoffs_stagging2;

INSERT INTO layoffs_stagging2
SELECT *, 
	ROW_NUMBER() OVER(
	PARTITION BY company,location,industry,total_laid_off, percentage_laid_off,
    `date`,stage,country,funds_raised_millions) AS row_num
	FROM layoffs_stagging;
    
DELETE
FROM layoffs_stagging2
WHERE row_num > 1; 

SELECT * 
FROM layoffs_stagging2
WHERE row_num > 1;

-- Standardizing Data 

SELECT company, TRIM(company)
FROM layoffs_stagging2;

UPDATE layoffs_stagging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_stagging2
WHERE industry LIKE 'Crypto%';



UPDATE layoffs_stagging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_stagging2
ORDER BY 1;

UPDATE layoffs_stagging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`,
str_to_date(`date`,'%m/%d/%Y')
FROM layoffs_stagging2;

UPDATE layoffs_stagging2
SET `date` = str_to_date(`date`,'%m/%d/%Y'); 

ALTER TABLE layoffs_stagging2
MODIFY COLUMN `date` DATE;

-- Null values and Blank Values

SELECT * 
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM layoffs_stagging2
WHERE company IS NULL
OR company = '';

SELECT * 
FROM layoffs_stagging2
WHERE industry IS NULL
OR industry = '';


SELECT * 
FROM layoffs_stagging2
WHERE company = 'Airbnb';

SELECT * 
FROM layoffs_stagging2 as lg1
JOIN layoffs_stagging2 as lg2
	ON lg1.company = lg2.company
	AND lg1.location = lg2.location
WHERE (lg1.industry IS NULL OR lg1.industry = '')
AND lg2.industry IS NOT NULL;

UPDATE layoffs_stagging2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_stagging2 as lg1
JOIN layoffs_stagging2 as lg2
	ON lg1.company = lg2.company
SET lg1.industry = lg2.industry
WHERE (lg1.industry IS NULL OR lg1.industry = '')
AND lg2.industry IS NOT NULL;

DELETE
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_stagging2;


-- DROP COLUMNS

ALTER TABLE layoffs_stagging2
DROP COLUMN row_num;


