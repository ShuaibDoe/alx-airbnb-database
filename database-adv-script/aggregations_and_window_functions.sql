-- File: aggregations_and_window_functions.sql
-- Project: ALX Airbnb Database - Advanced SQL
-- Author: Shuaib Doe
-- Description: SQL queries demonstrating aggregation and window functions


--  Aggregation Query
-- Find total number of bookings made by each user using COUNT() and GROUP BY

SELECT 
    u.id AS user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


--  Window Function Query
-- Rank properties based on the total number of bookings they have received
-- using the ROW_NUMBER() window function

SELECT 
    p.id AS property_id,
    p.title AS property_title,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY booking_rank;

