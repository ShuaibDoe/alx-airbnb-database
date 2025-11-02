#  Optimization Report — Complex Query Performance

##  Objective
This task focuses on identifying inefficiencies in a multi-table SQL query and refactoring it for better performance.  
We use **EXPLAIN** and **ANALYZE** to measure improvements before and after optimization.

---

##  Step 1 — Initial Query Overview

**Goal:** Retrieve all bookings with corresponding user, property, and payment details.

```sql
SELECT 
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    u.email,
    p.title AS property_title,
    p.city,
    p.country,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
