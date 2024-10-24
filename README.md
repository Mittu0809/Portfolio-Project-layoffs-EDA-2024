# Portfolio-Project-layoffs-EDA-2024
Exploratory Data Analysis (EDA) of a cleaned dataset on global layoffs, focusing on deriving insights related to companies, industries, countries, and trends over time using advanced SQL queries.

This repository contains the exploratory data analysis (EDA) for a cleaned dataset related to layoffs across various companies. This project follows the data cleaning process and uses SQL queries to extract meaningful insights from the dataset, focusing on trends related to company layoffs, industries, countries, time periods, and company stages.

Layoffs EDA (2024) Description:
The dataset for this analysis contains information about layoffs across industries such as technology, retail, healthcare, and more. Key data points include company names, total laid off, percentage laid off, dates, stages of companies, industries, and countries.

The primary goal of this project is to derive meaningful insights from the cleaned dataset to understand layoffs trends across various dimensions like industries, countries, company stages, and over time.

Table of Contents
- Project Overview
- Technologies Used
- EDA Steps
- Key Insights and Trends
- Challenges Faced
- Outcomes
- Usage
- Dataset: https://www.kaggle.com/datasets/swaptr/layoffs-2022

  Project Overview
This exploratory data analysis (EDA) focuses on understanding layoffs trends using the cleaned layoffs dataset. The project involves querying and analyzing data by company, industry, country, date, and stage. Key tasks include identifying the companies with the highest layoffs, industries hit hardest by layoffs, date-wise trends, and more. Additionally, rolling sum calculations are performed to observe cumulative layoffs over time.

Technologies Used
- SQL (MySQL)
- Data Exploration Techniques
- Window Functions and CTEs for Advanced Analysis
- EDA Steps

EDA Steps: 
1. Dataset Overview:
Display all records in the cleaned dataset to ensure it is ready for analysis.

2. Maximum Layoffs:
Identify the maximum number of employees laid off in a single day and companies with 100% layoffs.

3. Industry and Country Analysis:
Group data by industry and country to observe which sectors and regions were impacted the most.

4. Date and Year-wise Analysis:
Analyze layoffs by date and year to identify trends over time. The rolling sum of layoffs is calculated to visualize the cumulative effect.

5. Stage-wise Layoffs:
Explore the impact of layoffs on companies in different stages (e.g., Series A, Post-IPO) and rank the top companies based on layoffs in each year.

6. Top Companies by Layoffs:
Rank companies by total layoffs per year and identify the top 5 companies with the most layoffs.

7. Month-wise Layoffs:
Analyze the month-wise total layoffs to spot any seasonal patterns.
Detailed SQL queries for each step are included in the repository for further reference.

Key Insights and Trends
- Highest Layoffs:
The maximum single-day layoff exceeded 12,000 employees. Several companies experienced 100% layoffs.

- Industry and Country Trends:
The consumer, retail, and transportation industries saw the highest number of layoffs, with the United States leading in terms of layoffs, followed by India and Netherlands.

- Date Trends:
The year 2022 saw the most significant layoffs, followed by 2023.

-Stage-wise Layoffs:
The largest layoffs occurred in Post-IPO companies, with Series C and Series D companies also being heavily impacted.

-Top Companies:
Notable companies such as Uber, Bytedance, Meta, and Google had the highest layoffs during different years.

Challenges Faced 

- Complex Grouping: Grouping data by industry, country, and company required advanced SQL functions like window functions and Common Table Expressions (CTEs) for effective analysis.

- Handling Large Date Ranges: Analyzing trends over multiple years required thoughtful handling of date formats and rolling sum calculations to derive meaningful insights.

- Data Interpretation: Interpreting the trends from the percentage laid off required deeper understanding of how layoffs unfolded across industries and regions.

Outcomes

- Data-driven Insights: The project offers detailed insights into the global layoffs trends across different industries, regions, and companies.

- Rolling Sum Analysis: The rolling sum calculation provided a cumulative view of layoffs over time, highlighting key periods of layoffs surges.

- Year-wise and Industry-wise Trends: Clear trends emerged showing which industries were hit hardest and which years saw the most layoffs.

Usage
To explore the SQL queries and insights from the cleaned dataset:

1. Clone the repository:

git clone https://github.com/yourusername/Portfolio-Project-layoffs-EDA-2024.git

2. Import the SQL files into your database management system.

3. Follow the documented SQL queries to analyze the layoffs data, trends, and insights.

This project continues the work from the Layoffs Data Cleaning (2024) repository. Make sure to check the data cleaning steps if needed.
