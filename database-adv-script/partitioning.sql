-- File: partitioning.sql
-- Project: ALX Airbnb Database - Table Partitioning
-- Author: Shuaib Doe
-- Description: Implement partitioning on the Bookings table for performance optimization


--  Step 1: Create Partitioned Bookings Table


-- Drop existing partitioned table if it exists
DROP TABLE IF EXISTS bookings_partitioned CASCADE;

-- Create parent table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (start_date);

-- ===========================================
--  Step 2: Create Partitions by Year
-- ===========================================

-- Partition for 2023 Bookings
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2023-01-01') TO ('2023-12-31');

-- Partition for 2024 Bookings
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2024-12-31');

-- Partition for 2025 Bookings
CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2025-12-31');

-- Default partition for future bookings
CREATE TABLE bookings_future PARTITION OF bookings_partitioned
FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);

-- ===========================================
--  Step 3: Insert Sample Data
-- ===========================================
INSERT INTO bookings_partitioned (user_id, property_id, start_date, end_date, total_amount, status) VALUES
(1, 2, '2023-05-10', '2023-05-15', 250.00, 'confirmed'),
(2, 3, '2024-03-20', '2024-03-25', 400.00, 'completed'),
(3, 4, '2024-08-02', '2024-08-06', 300.00, 'pending'),
(4, 1, '2025-01-15', '2025-01-18', 350.00, 'confirmed'),
(5, 5, '2025-04-10', '2025-04-14', 280.00, 'cancelled');

-- ===========================================
--  Step 4: Test Query Performance
-- ===========================================
-- Example query before optimization (non-partitioned table):
-- EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-06-01';

-- Optimized query using partitioned table:
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-01';

--  Expected Result:
-- Query will only scan relevant partitions (bookings_2025)
-- Significantly reduced I/O and improved query time.

-- ===========================================
-- End of File
-- ===========================================
