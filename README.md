# PG-Rental-SQL-Analysis
SQL-based analysis of PG rental listings to evaluate affordability, locality trends, amenities, metro accessibility, and customer-specific housing options.
# PG Rental Market & Affordability Analysis Using SQL

## 📌 Project Overview

Finding suitable PG accommodation in Mumbai can be challenging for students and working professionals because they need to balance rental cost, location, accessibility, safety, amenities, and accommodation quality.

This project uses SQL to analyze a dataset of PG listings and identify rental patterns, affordability levels, locality trends, amenity-related pricing differences, and suitable accommodation options based on customer requirements.

---

## 🎯 Business Problem

A person searching for a PG may have requirements such as:

- Affordable monthly rent
- Female-friendly accommodation
- Good ratings
- Proximity to metro stations
- Wi-Fi and security
- Food availability
- Suitable sharing options

The objective of this project is to use SQL-based analysis to help users make more informed accommodation decisions.

---

## 📊 Dataset

The dataset contains **30 synthetic PG listings** created for this portfolio project.

Each listing contains information about:

- PG name
- Locality
- City
- Monthly rent
- Sharing type
- Gender preference
- Food availability
- Wi-Fi
- AC
- Laundry
- Security
- Distance from metro
- Rating

> **Note:** The dataset is synthetic and created for demonstration purposes. The results represent patterns within this project dataset and should not be interpreted as actual Mumbai rental-market statistics.

---

## 🛠️ Tools & Technologies

- MySQL
- SQL
- GitHub

### SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate Functions
- CASE Statements
- UNION ALL
- JOINs
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- Subqueries

---

## 🔍 Analysis Performed

### 1. Locality-wise Rental Analysis

Calculated the average PG rent across different Mumbai localities to understand rental variation.

### 2. Customer Requirement Filtering

Identified PGs matching specific requirements such as:

- Rent ≤ ₹15,000
- Female accommodation
- Wi-Fi
- Security
- Metro distance ≤ 1.5 km

### 3. Sharing Type Analysis

Compared:

- Number of PGs
- Average rent
- Minimum rent
- Maximum rent

across different sharing types.

### 4. Price Segmentation

Categorized PGs into:

- Budget
- Moderate
- Premium

based on monthly rental price.

### 5. Amenity vs Rent Analysis

Compared average rental prices for PGs with and without:

- AC
- Food
- Laundry

### 6. Multi-Criteria Recommendation

Filtered PGs based on multiple requirements including:

- Rent
- Rating
- Metro accessibility
- Wi-Fi
- Security
- Food availability

### 7. Locality-wise Ranking

Used SQL window functions to identify the highest-rated PG within each locality.

### 8. Locality Price Benchmarking

Compared individual PG rents against the average rent of their respective locality.

### 9. Rule-Based Recommendation Score

Created a business-defined scoring system based on:

- Affordability
- Rating
- Metro accessibility
- Food
- Wi-Fi
- Security

to help prioritize listings that satisfy multiple criteria.

---

## 💡 Key Business Insights

Based on the analysis of the project dataset:

- Rental prices varied considerably across different Mumbai localities.
- Bandra West had the highest average rent among the listed localities in the dataset.
- Different sharing types showed differences in average, minimum and maximum rental prices.
- PG listings were segmented into Budget, Moderate and Premium categories based on monthly rent.
- Amenity availability was compared with average rental prices to identify pricing patterns within the dataset.
- Individual PG rents were benchmarked against the average rent of their respective locality.
- Multi-criteria filtering helped identify PGs matching specific requirements related to affordability, rating, metro accessibility and amenities.
- A rule-based recommendation score was developed using business-defined criteria such as affordability, rating, accessibility, food, Wi-Fi and security.

> **Note:** These findings are based on the synthetic dataset created for this project and do not represent actual Mumbai rental-market statistics.

---

## 📁 Project Structure

```text
PG-Rental-SQL-Analysis/
│
├── README.md
│
├── sql/
│   ├── 01_create_table.sql
│   ├── 02_insert_data.sql
│   └── 03_analysis_queries.sql 
