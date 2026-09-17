-- ============================================================
-- PG RENTAL MARKET & AFFORDABILITY ANALYSIS
-- SQL Analysis Queries
-- ============================================================


-- 1. Average Rent by Locality
-- Identifies localities with higher and lower average rental prices.

SELECT 
    locality,
    ROUND(AVG(monthly_rent), 0) AS average_rent
FROM pg_listings
GROUP BY locality
ORDER BY average_rent DESC;


-- ============================================================
-- 2. Customer Requirement Filter
-- Example requirement:
-- Female accommodation, rent <= 15000,
-- Wi-Fi, security, and metro distance <= 1.5 km.

SELECT
    pg_name,
    locality,
    monthly_rent,
    sharing_type,
    distance_to_metro_km,
    rating
FROM pg_listings
WHERE monthly_rent <= 15000
  AND gender = 'Female'
  AND wifi = 'Yes'
  AND security = 'Yes'
  AND distance_to_metro_km <= 1.5
ORDER BY monthly_rent ASC;


-- ============================================================
-- 3. Sharing Type Affordability Analysis
-- Compares number of listings and rental ranges
-- across different sharing types.

SELECT
    sharing_type,
    COUNT(*) AS number_of_pgs,
    ROUND(AVG(monthly_rent), 0) AS average_rent,
    MIN(monthly_rent) AS minimum_rent,
    MAX(monthly_rent) AS maximum_rent
FROM pg_listings
GROUP BY sharing_type
ORDER BY average_rent ASC;


-- ============================================================
-- 4. Price Categorization
-- Segments PG listings into Budget, Moderate and Premium.

SELECT
    pg_name,
    locality,
    monthly_rent,
    CASE
        WHEN monthly_rent <= 12000 THEN 'Budget'
        WHEN monthly_rent <= 18000 THEN 'Moderate'
        ELSE 'Premium'
    END AS price_category
FROM pg_listings
ORDER BY monthly_rent ASC;


-- ============================================================
-- 5. Price Category Distribution
-- Calculates the number and percentage of PGs
-- in each price segment.

SELECT
    price_category,
    COUNT(*) AS number_of_pgs,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_total
FROM
(
    SELECT
        CASE
            WHEN monthly_rent <= 12000 THEN 'Budget'
            WHEN monthly_rent <= 18000 THEN 'Moderate'
            ELSE 'Premium'
        END AS price_category
    FROM pg_listings
) AS categorized_pgs
GROUP BY price_category
ORDER BY percentage_of_total DESC;


-- ============================================================
-- 6. Amenity vs Average Rent
-- Compares average rental prices for PGs
-- with and without selected amenities.

SELECT
    'AC' AS amenity,
    ac AS available,
    COUNT(*) AS number_of_pgs,
    ROUND(AVG(monthly_rent), 0) AS average_rent
FROM pg_listings
GROUP BY ac

UNION ALL

SELECT
    'Food' AS amenity,
    food_available AS available,
    COUNT(*) AS number_of_pgs,
    ROUND(AVG(monthly_rent), 0) AS average_rent
FROM pg_listings
GROUP BY food_available

UNION ALL

SELECT
    'Laundry' AS amenity,
    laundry AS available,
    COUNT(*) AS number_of_pgs,
    ROUND(AVG(monthly_rent), 0) AS average_rent
FROM pg_listings
GROUP BY laundry

ORDER BY amenity, available;


-- ============================================================
-- 7. Multi-Criteria PG Recommendation
-- Finds listings satisfying multiple customer requirements.

SELECT
    pg_name,
    locality,
    monthly_rent,
    sharing_type,
    distance_to_metro_km,
    rating
FROM pg_listings
WHERE monthly_rent <= 18000
  AND rating >= 4.3
  AND distance_to_metro_km <= 1
  AND wifi = 'Yes'
  AND security = 'Yes'
  AND food_available = 'Yes'
ORDER BY rating DESC, monthly_rent ASC;


-- ============================================================
-- 8. Highest-Rated PG in Each Locality
-- Uses ROW_NUMBER() window function to rank
-- listings within each locality.

WITH ranked_pgs AS (
    SELECT
        pg_name,
        locality,
        monthly_rent,
        rating,
        ROW_NUMBER() OVER (
            PARTITION BY locality
            ORDER BY rating DESC, monthly_rent ASC
        ) AS rank_in_locality
    FROM pg_listings
)

SELECT
    pg_name,
    locality,
    monthly_rent,
    rating
FROM ranked_pgs
WHERE rank_in_locality = 1
ORDER BY rating DESC;


-- ============================================================
-- 9. Compare PG Rent with Locality Average
-- Identifies listings priced above or below
-- their locality's average rent.

WITH locality_avg AS (
    SELECT
        locality,
        AVG(monthly_rent) AS avg_locality_rent
    FROM pg_listings
    GROUP BY locality
)

SELECT
    p.pg_name,
    p.locality,
    p.monthly_rent,
    ROUND(l.avg_locality_rent, 0) AS locality_average_rent,
    ROUND(
        p.monthly_rent - l.avg_locality_rent,
        0
    ) AS difference_from_average,

    CASE
        WHEN p.monthly_rent > l.avg_locality_rent
            THEN 'Above Locality Average'
        WHEN p.monthly_rent < l.avg_locality_rent
            THEN 'Below Locality Average'
        ELSE 'At Locality Average'
    END AS price_position

FROM pg_listings p
JOIN locality_avg l
    ON p.locality = l.locality
ORDER BY difference_from_average DESC;


-- ============================================================
-- 10. Rule-Based Recommendation Score
-- Creates a business-defined score using:
-- affordability, rating, metro accessibility,
-- food, Wi-Fi and security.

SELECT
    pg_name,
    locality,
    monthly_rent,
    rating,
    distance_to_metro_km,

    (
        CASE
            WHEN monthly_rent <= 12000 THEN 3
            WHEN monthly_rent <= 18000 THEN 2
            ELSE 1
        END

        +

        CASE
            WHEN rating >= 4.5 THEN 3
            WHEN rating >= 4.2 THEN 2
            ELSE 1
        END

        +

        CASE
            WHEN distance_to_metro_km <= 0.75 THEN 2
            ELSE 0
        END

        +

        CASE
            WHEN food_available = 'Yes' THEN 1
            ELSE 0
        END

        +

        CASE
            WHEN wifi = 'Yes' THEN 1
            ELSE 0
        END

        +

        CASE
            WHEN security = 'Yes' THEN 1
            ELSE 0
        END

    ) AS recommendation_score

FROM pg_listings
ORDER BY recommendation_score DESC, rating DESC;


-- ============================================================
-- 11. Overall Market Summary
-- Provides high-level statistics for the dataset.

SELECT
    COUNT(*) AS total_pgs,
    ROUND(AVG(monthly_rent), 0) AS overall_average_rent,
    MIN(monthly_rent) AS lowest_rent,
    MAX(monthly_rent) AS highest_rent,
    ROUND(AVG(rating), 2) AS average_rating,
    ROUND(AVG(distance_to_metro_km), 2) AS average_metro_distance
FROM pg_listings;


-- ============================================================
-- 12. Affordable & High-Quality PGs
-- Filters listings based on affordability,
-- rating and metro accessibility.

SELECT
    pg_name,
    locality,
    monthly_rent,
    rating,
    distance_to_metro_km,
    sharing_type
FROM pg_listings
WHERE rating >= 4.3
  AND monthly_rent <= 15000
  AND distance_to_metro_km <= 1
ORDER BY monthly_rent ASC, rating DESC;
