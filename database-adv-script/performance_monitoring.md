#  Database Performance Monitoring and Refinement Report

##  Objective
The objective of this task is to **monitor**, **analyze**, and **refine** the performance of SQL queries executed in the Airbnb database.  
Tools such as `EXPLAIN ANALYZE` and `SHOW PROFILE` are used to identify inefficiencies and bottlenecks.

---

##  Step 1 — Monitoring Queries

Frequent queries analyzed include:
1. Retrieving bookings by user.
2. Fetching property details with reviews.
3. Aggregating booking counts per property.

### Example 1 — Bookings by User
```sql
EXPLAIN ANALYZE
SELECT b.id, b.start_date, b.end_date, p.title, p.city
FROM bookings b
JOIN properties p ON b.property_id = p.id
WHERE b.user_id = 10
ORDER BY b.start_date DESC;
