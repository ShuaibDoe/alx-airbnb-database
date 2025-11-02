#  Partitioning Large Tables — Performance Report

##  Objective
The goal of this task is to **improve query performance** on a large `bookings` table by implementing **table partitioning** based on the `start_date` column.

---

##  Step 1 — Problem Overview
The `bookings` table contains a large volume of historical and future booking data.  
Queries filtering by date (e.g., "bookings in 2025") were slow due to **full table scans**.

**Example of initial query:**
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-01';
