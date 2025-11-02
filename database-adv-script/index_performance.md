#  Implement Indexes for Optimization

##  Objective
The goal of this task is to identify high-usage columns in key Airbnb database tables and create **indexes** to improve query performance.  
This exercise demonstrates how proper indexing can dramatically speed up data retrieval in high-volume systems.

---

##  Learning Goals
- Identify query performance bottlenecks.  
- Create and apply efficient indexes using `CREATE INDEX`.  
- Use `EXPLAIN` and `ANALYZE` to measure performance before and after optimization.  
- Balance speed improvements against potential storage overhead.

---

##  Step 1 — Identify High-Usage Columns
Based on the project schema, the following columns are frequently used in **WHERE**, **JOIN**, and **ORDER BY** clauses:

| Table | Column | Usage | Purpose |
|--------|---------|--------|----------|
| `bookings` | `user_id` | JOIN | Links bookings to users |
| `bookings` | `property_id` | JOIN | Links bookings to properties |
| `bookings` | `created_at` | ORDER BY / Filter | Sort or filter bookings by date |
| `users` | `email` | WHERE | Search users during login |
| `properties` | `city` | WHERE | Filter properties by location |

---

##  Step 2 — Create Indexes
The following SQL commands create indexes for these columns:

```sql
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE UNIQUE INDEX idx_users_email ON users (email);
CREATE INDEX idx_properties_city ON properties (city);
CREATE INDEX idx_bookings_created_at ON bookings (created_at);
