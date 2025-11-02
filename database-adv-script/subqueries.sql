-- File: subqueries.sql
-- Project: ALX Airbnb Database - Advanced SQL
-- Author: Shuaib Doe
-- Description: Practice subqueries (correlated and non-correlated)


-- 1 Non-Correlated Subquery:
-- Find all properties where the average rating is greater than 4.0
SELECT 
    p.id AS property_id,
    p.title AS property_title,
    p.location
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);



-- 2 Correlated Subquery:
-- Find users who have made more than 3 bookings
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;

