#  ALX Airbnb Database — Schema Definition

##  Overview
This module defines the **SQL schema** for the **Airbnb Clone backend database**, forming the foundation for user management, property listings, bookings, payments, and reviews.  
It adheres to **normalization up to 3NF**, ensuring data integrity, performance, and scalability.

---

##  Objective
Design and implement a **relational database schema** that supports:
- User authentication and roles (guest, host, admin)
- Property listings and amenities
- Booking management and validation
- Secure payment processing
- Guest reviews for properties

---

##  Key Tables & Relationships

| Table | Description | Primary Key | Foreign Keys |
|--------|--------------|--------------|---------------|
| **users** | Stores user accounts and roles | `user_id` | — |
| **properties** | Stores property details linked to hosts | `property_id` | `host_id → users(user_id)` |
| **property_amenities** | Lists amenities per property | `(property_id, amenity_name)` | `property_id → properties(property_id)` |
| **bookings** | Manages reservations by guests | `booking_id` | `property_id`, `guest_id` |
| **payments** | Records payments for each booking | `payment_id` | `booking_id → bookings(booking_id)` |
| **reviews** | Stores user feedback | `review_id` | `property_id`, `guest_id` |

---

##  Features and Constraints
- **Referential integrity** enforced with foreign key constraints.
- **Data validation** via `CHECK` constraints (e.g., dates, ratings, payment status).
- **Indexing** on key lookup fields for faster queries (`email`, `location`, etc.).
- **Cascade deletions** maintain consistency when parent records are removed.
- **Unique** constraints ensure no duplicate user emails or booking payments.

---

##  Relationships Summary
