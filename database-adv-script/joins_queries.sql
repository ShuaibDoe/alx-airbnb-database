-- File: joins_queries.sql
-- Project: ALX Airbnb Database - Advanced SQL
-- Author: Shuaib Doe
-- Description: Complex SQL queries using JOINs


--  INNER JOIN: Retrieve all bookings and their respective users
SELECT 
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.check_in_date,
    bookings.check_out_date
FROM bookings
INNER JOIN users 
ON bookings.user_id = users.id;

-- -------------------------------------------

--  LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews
SELECT 
    properties.id AS property_id,
    properties.title AS property_title,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews 
ON properties.id = reviews.property_id;

-- -------------------------------------------

--  FULL OUTER JOIN: Retrieve all users and all bookings,
-- even if a user has no booking or a booking is not linked to a user
SELECT 
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.check_in_date,
    bookings.check_out_date
FROM users
FULL OUTER JOIN bookings 
ON users.id = bookings.user_id;

