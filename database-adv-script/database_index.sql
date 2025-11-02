-- File: database_index.sql
-- Project: ALX Airbnb Database - Index Optimization
-- Author: Shuaib Doe
-- Description: Creating indexes to improve query performance


--  Check performance BEFORE indexing
-- Example: Fetch bookings by user_id
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 3;

-- Example: Join users and bookings on user_id
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, b.start_date, b.end_date
FROM users u
JOIN bookings b ON u.id = b.user_id
WHERE b.start_date > '2025-01-01';


--  Create Indexes on High-Usage Columns

-- Index on 'user_id' in bookings table for faster lookups and joins
CREATE INDEX idx_bookings_user_id ON bookings (user_id);

-- Index on 'property_id' in bookings table for property-based queries
CREATE INDEX idx_bookings_property_id ON bookings (property_id);

-- Index on 'email' in users table to speed up searches and authentication
CREATE UNIQUE INDEX idx_users_email ON users (email);

-- Index on 'city' in properties table to optimize property filtering by location
CREATE INDEX idx_properties_city ON properties (city);

-- Index on 'created_at' in bookings table for sorting and date filtering
CREATE INDEX idx_bookings_created_at ON bookings (created_at);


--  Measure Performance AFTER Indexing

-- Test the same queries again with EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 3;

EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, b.start_date, b.end_date
FROM users u
JOIN bookings b ON u.id = b.user_id
WHERE b.start_date > '2025-01-01';

-- ===========================================
--  Optional: Review Created Indexes
-- ===========================================
-- View indexes for verification
-- \d bookings
-- \d users
-- \d properties


