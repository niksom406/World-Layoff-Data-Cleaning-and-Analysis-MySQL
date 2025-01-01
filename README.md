# World Layoff Data Cleaning and Analysis

This project demonstrates data cleaning and exploratory data analysis (EDA) on a dataset of global layoffs. Using SQL, duplicate entries are removed, data is standardized, missing or null values are addressed, and irrelevant columns are dropped. Finally, EDA is performed to extract insights such as the industries, companies, and countries most affected by layoffs, and trends over time.

## Table of Contents

- [Introduction](#introduction)
- [Technologies Used](#technologies-used)
- [Steps Performed](#steps-performed)
  - [1. Data Cleaning](#1-data-cleaning)
  - [2. Exploratory Data Analysis (EDA)](#2-exploratory-data-analysis-eda)
- [SQL Queries](#sql-queries)
- [Insights](#insights)
- [How to Run the Queries](#how-to-run-the-queries)
- [License](#license)

## Introduction

The dataset used in this project contains information about layoffs, including details such as company name, location, industry, total laid off, percentage laid off, date, stage, country, and funds raised. The project focuses on preparing the data for analysis by cleaning and standardizing it, followed by performing exploratory analysis to uncover patterns and trends.

## Technologies Used

- **SQL**: For data cleaning and analysis
- **MySQL**: Database used to execute the SQL queries
- **GitHub**: For project version control and sharing

## Steps Performed

### 1. Data Cleaning

- **Removing Duplicates:** Identified and removed duplicate records using `ROW_NUMBER`.
- **Standardizing Data:**
  - Trimmed extra spaces in columns like `company` and `country`.
  - Standardized inconsistent values (e.g., grouped similar industry names).
  - Converted date columns to a uniform format using `STR_TO_DATE`.
- **Handling Null/Blank Values:**
  - Replaced null or blank values in key columns with meaningful data if available.
  - Deleted records with completely missing critical values.
- **Dropping Columns:** Removed unnecessary columns such as temporary fields (e.g., `row_num`).

### 2. Exploratory Data Analysis (EDA)

Performed EDA to uncover trends and insights:
- Maximum and minimum layoffs.
- Companies and industries most impacted by layoffs.
- Trends in layoffs by year and month.
- Layoffs by country and funding stage.
- Rolling totals and year-wise rankings.

## SQL Queries

The complete SQL code for data cleaning and EDA is available in the repository under the file `layoffs_analysis.sql`. It contains structured queries for each step outlined above.

## Insights

Here are some key insights derived from the analysis:

- **Industries Affected:** The `Crypto` industry was among the most impacted.
- **Countries:** The `United States` had the highest number of layoffs.
- **Companies:** Some companies had layoffs exceeding 10,000 employees in a single year.
- **Trends:** Layoffs peaked in certain months, and the overall trend showed significant layoffs in the last two years.

## How to Run the Queries

1. **Setup Database:**
   - Import your dataset into a table named `layoffs` in your MySQL database.

2. **Create Staging Table:**
   - Run the provided SQL queries to create and populate the `layoffs_stagging` and `layoffs_stagging2` tables.

3. **Execute Queries:**
   - Follow the queries step-by-step to clean and analyze the data.

4. **View Results:**
   - Use `SELECT` statements at the end of the SQL file to inspect cleaned data and insights.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Feel free to fork this repository and use it for your own analysis! If you find it helpful, give it a star on GitHub!
