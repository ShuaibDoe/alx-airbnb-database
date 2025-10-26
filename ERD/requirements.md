#  Entity-Relationship Diagram (ERD) Requirements

##  Objective
The objective of this task is to **design a comprehensive Entity-Relationship Diagram (ERD)** that visualizes how different entities within the **Airbnb-like database system** interact with one another.  
This ERD serves as the foundation for database schema design, ensuring data consistency, normalization, and scalability.

---

##  Entities and Attributes

### 1. **User**
Represents all users in the system (guests, hosts, and administrators).

**Attributes**
- `user_id` (Primary Key)
- `first_name`
- `last_name`
- `email`
- `password_hash`
- `phone_number`
- `role` (guest, host, admin)
- `created_at`

---

### 2. **Property**
Represents listings created by hosts.

**Attributes**
- `property_id` (Primary Key)
- `host_id` (Foreign Key → User)
- `title`
- `description`
- `location`
- `price_per_night`
- `property_type` (apartment, house, etc.)
- `number_of_bedrooms`
- `number_of_bathrooms`
- `amenities`
- `created_at`

---

### 3. **Booking**
Captures reservation details for a specific property made by a guest.

**Attributes**
- `booking_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `guest_id` (Foreign Key → User)
- `check_in_date`
- `check_out_date`
- `total_price`
- `status` (pending, confirmed, cancelled)
- `created_at`

---

### 4. **Payment**
Tracks payment transactions associated with bookings.

**Attributes**
- `payment_id` (Primary Key)
- `booking_id` (Foreign Key → Booking)
- `amount`
- `payment_method` (credit_card, paypal, etc.)
- `payment_status` (paid, refunded, pending)
- `transaction_date`

---

### 5. **Review**
Stores feedback from guests about properties.

**Attributes**
- `review_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `guest_id` (Foreign Key → User)
- `rating` (1–5)
- `comment`
- `created_at`

---

##  Relationships Between Entities

| Relationship | Type | Description |
|---------------|------|-------------|
| **User → Property** | One-to-Many | A host can list multiple properties. |
| **User → Booking** | One-to-Many | A guest can make multiple bookings. |
| **Property → Booking** | One-to-Many | A property can have multiple bookings. |
| **Booking → Payment** | One-to-One | Each booking has one payment record. |
| **Property → Review** | One-to-Many | A property can receive multiple reviews. |
| **User → Review** | One-to-Many | A user (guest) can leave multiple reviews. |

---

##  ERD Description
Your ERD should visually represent:
- All **entities** listed above.
- **Primary and foreign keys** to indicate relationships.
- **Cardinality** (1:1, 1:N, N:M) for each connection.
- Proper **naming conventions** for all tables and attributes.

Use **Draw.io (Diagrams.net)** or a similar tool to design your diagram.

---

##  Submission Deliverables
After creating your ERD:

1. Export the diagram as a **PNG file**.  
   **File name:** `erd-diagram.png`

2. Store it in the following directory structure:
