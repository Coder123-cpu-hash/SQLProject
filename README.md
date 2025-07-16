# SQL Data Cleaning and Exploratory Data Analysis (EDA)

## 📌 Project Overview
This project demonstrates **Data Cleaning** and **Exploratory Data Analysis** using SQL.  
The dataset contains company layoffs information. The objective is to clean the raw data, standardize it, and uncover meaningful insights through analysis.

> **Note:** This project was inspired by Alex The Analyst's SQL tutorials, but the implementation and analysis have been done independently by me.

---

## 🔍 Steps Performed

### 1️⃣ Data Cleaning
- Removed duplicates using **ROW_NUMBER()** and CTEs.
- Standardized fields:
  - Trimmed extra spaces.
  - Corrected inconsistent industry names (e.g., `CRYPTO` → `Crypto`).
  - Standardized country names (`United States`).
- Converted date strings to **DATE** type.
- Handled missing and blank values in **industry**.
- Removed rows with null values in both `total_laid_off` and `percentage_laid_off`.

### 2️⃣ Exploratory Data Analysis (EDA)
- Total layoffs by **Company**, **Industry**, and **Country**.
- Year-wise and month-wise layoffs trend.
- Identified companies with **100% layoffs**.
- Top 5 companies with the highest layoffs per year.
- Rolling total layoffs over time.

---

## 🛠️ Technologies Used
- **SQL (MySQL)** for data cleaning and analysis.

---

## 📂 Project Files
- `data Cleaning Project.sql` → Data Cleaning steps.
- `EDA Project.sql` → Exploratory Data Analysis queries.

---

## 📈 Key Insights
- Certain industries faced the highest layoffs.
- Trend analysis shows layoffs increased significantly during specific years.
- Some companies had complete workforce reductions.

---

## 🚀 How to Run
1. Import the raw dataset into your MySQL database.
2. Execute the scripts in the following order:
   - `data Cleaning Project.sql`
   - `EDA Project.sql`
3. Explore the cleaned data and generated insights.

---

## 👩‍💻 Author
Payal Nagda  
📫 [LinkedIn](https://www.linkedin.com/in/payal-nagda) | 💻 [GitHub](https://github.com/Coder123-cpu-hash)
