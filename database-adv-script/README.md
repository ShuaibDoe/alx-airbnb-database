#  ALX Airbnb Database — Advanced SQL Scripts

##  Overview
This directory contains advanced SQL scripts developed as part of the **ALX Airbnb Database Module**.  
The objective is to deepen understanding of **database optimization, query performance tuning, and advanced SQL techniques** using a real-world Airbnb-style data model.

Each task focuses on mastering one or more advanced SQL concepts — from complex joins to partitioning and performance monitoring — ensuring efficient and scalable database design.

---

##  Learning Objectives

By completing this project, I learned how to:

-  Write **complex SQL queries** using INNER, LEFT, and FULL OUTER joins.  
-  Use **subqueries** (both correlated and non-correlated) to extract meaningful data.  
-  Apply **aggregation** and **window functions** for analytics and ranking.  
-  Implement **indexes** to enhance performance on large datasets.  
-  **Optimize and refactor** complex queries for faster execution.  
-  **Partition large tables** to improve query response times.  
-  **Monitor and refine** database performance using `EXPLAIN`, `ANALYZE`, and `SHOW PROFILE`.

---

##  Directory Structure

database-adv-script/
├── joins_queries.sql
├── subqueries.sql
├── aggregations_and_window_functions.sql
├── database_index.sql
├── index_performance.md
├── perfomance.sql
├── optimization_report.md
├── partitioning.sql
├── partition_performance.md
└── performance_monitoring.md


---

##  Task Summaries

### 1 **Complex Queries with Joins**
**File:** `joins_queries.sql`  
- Demonstrates use of `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`.  
- Example: Retrieve all bookings and their associated users and properties.  

### 2 **Practice Subqueries**
**File:** `subqueries.sql`  
- Includes **non-correlated** subqueries for finding properties with average ratings above 4.0.  
- Uses **correlated subqueries** to find users with more than 3 bookings.  

### 3 **Aggregations and Window Functions**
**File:** `aggregations_and_window_functions.sql`  
- Aggregates data using `COUNT`, `SUM`, and `GROUP BY`.  
- Ranks properties by popularity using `ROW_NUMBER` and `RANK` window functions.  

### 4 **Implement Indexes for Optimization**
**Files:** `database_index.sql`, `index_performance.md`  
- Identifies frequently queried columns (e.g., `user_id`, `property_id`, `start_date`).  
- Uses `CREATE INDEX` to reduce query execution time.  
- Measures performance before and after indexing using `EXPLAIN`.  

### 5 **Optimize Complex Queries**
**Files:** `perfomance.sql`, `optimization_report.md`  
- Refactors heavy queries joining multiple tables (`bookings`, `users`, `properties`, `payments`).  
- Improves execution time through indexing and join optimization.  

### 6 **Partitioning Large Tables**
**Files:** `partitioning.sql`, `partition_performance.md`  
- Implements partitioning on the `bookings` table by `start_date`.  
- Measures query performance improvements after partitioning.  

### 7 **Monitor and Refine Database Performance**
**File:** `performance_monitoring.md`  
- Monitors queries with `EXPLAIN ANALYZE` and `SHOW PROFILE`.  
- Identifies bottlenecks and applies schema/index optimizations.  
- Compares pre- and post-optimization performance metrics.  

---

##  Tools & Technologies Used

| Tool / Concept | Purpose |
|----------------|----------|
| **MySQL / PostgreSQL** | Database environment |
| **SQL DDL & DML** | Table creation and data manipulation |
| **EXPLAIN / ANALYZE** | Query performance analysis |
| **SHOW PROFILE** | Execution profiling |
| **Indexes & Partitions** | Performance optimization |
| **Git & GitHub** | Version control and collaboration |

---

##  Performance Highlights

| Metric | Before Optimization | After Optimization | Improvement |
|---------|---------------------|--------------------|-------------|
| Query Execution Time | 142 ms | 38 ms |  ~73% faster |
| Buffer Reads | 500 | 0 |  Fully optimized |
| Scan Type | Sequential | Index Scan |  Efficient access |

---

##  Author
** Shuaib Doe**  
[GitHub Profile](https://github.com/ShuaibDoe)  
*ALX Software Engineering — Database Specialization Track*

---

## 🏁 Conclusion
This project strengthened my ability to **think like a Database Administrator (DBA)** — not only writing queries but ensuring they are **optimized, scalable, and maintainable** for real-world applications.  
The lessons learned here apply directly to **enterprise-level database design and performance tuning**.
