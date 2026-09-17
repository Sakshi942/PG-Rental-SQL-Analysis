CREATE TABLE pg_listings (
    pg_id INT PRIMARY KEY,
    pg_name VARCHAR(100),
    locality VARCHAR(50),
    city VARCHAR(50),
    monthly_rent INT,
    sharing_type VARCHAR(20),
    gender VARCHAR(20),
    food_available VARCHAR(10),
    wifi VARCHAR(10),
    ac VARCHAR(10),
    laundry VARCHAR(10),
    security VARCHAR(10),
    distance_to_metro_km DECIMAL(4,2),
    rating DECIMAL(2,1)
);
