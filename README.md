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

The analysis can help answer questions such as:

- Which localities have higher or lower average rents?
- Which sharing type provides lower-cost options?
- How many listings fall into each price category?
- Is there a rental-price difference between PGs with and without specific amenities?
- Which PGs satisfy a user's affordability and accessibility requirements?
- Which PG has the highest rating within each locality?
- Which listings are priced above or below their locality's average?

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
│
└── screenshots/
    ├── database.png
    ├── locality_analysis.png
    └── recommendation_analysis.png
