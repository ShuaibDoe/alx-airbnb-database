#  Database Normalization — Airbnb Database Project

##  Objective
The goal of this task is to **apply normalization principles** to ensure the Airbnb database schema is structured efficiently, eliminating redundancy, ensuring data integrity, and maintaining scalability.  
This process follows the **First (1NF)**, **Second (2NF)**, and **Third Normal Forms (3NF)**.

---

##  Initial Database Entities
The main entities in our Airbnb database are:

- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**

---

##  Step 1: First Normal Form (1NF)
### Rule
- Each table must have a **primary key**.
- All attributes must contain **atomic (indivisible)** values.
- There must be **no repeating groups** or arrays.

### Application
| Entity | Issue Identified | Action Taken |
|---------|------------------|---------------|
| **Property** | `amenities` field may contain multiple comma-separated values. | Split into a separate table `Property_Amenities` with a one-to-many relationship. |
| **User** | No issues found. | Primary key `user_id` ensures uniqueness. |
| **Booking**, **Payment**, **Review** | Already have atomic values and primary keys. | No changes required. |

 **Result:**  
Each table now has atomic values, unique identifiers, and no repeating groups.

---

##  Step 2: Second Normal Form (2NF)
### Rule
- Must satisfy **1NF**.
- All **non-key attributes** must depend **entirely on the primary key** (no partial dependencies).

### Application
| Entity | Issue Identified | Action Taken |
|---------|------------------|---------------|
| **Booking** | Initially had both `guest_id` and `property_id` influencing some data like `total_price`. | Ensured that all attributes depend on `booking_id` only, and `total_price` is computed during transactions, not stored redundantly. |
| **Property_Amenities** | Compound key (`property_id`, `amenity_name`) ensures dependency on the full key. | No issues found. |
| **Payment** | All attributes depend entirely on `booking_id`. | No changes required. |

 **Result:**  
All partial dependencies removed — every attribute fully depends on its table’s primary key.

---

##  Step 3: Third Normal Form (3NF)
### Rule
- Must satisfy **2NF**.
- No **transitive dependencies** (non-key attributes should not depend on other non-key attributes).

### Application
| Entity | Issue Identified | Action Taken |
|---------|------------------|---------------|
| **User** | `role` might influence certain permissions but not stored redundantly. | No change needed since role is atomic and non-derivable. |
| **Booking** | `total_price` depends on `price_per_night` of Property and duration, not directly stored. | Remove derived field; calculate dynamically. |
| **Payment** | `payment_status` and `payment_method` depend directly on `booking_id`. | No change needed. |

 **Result:**  
No transitive dependencies remain — each non-key attribute depends solely on its primary key.

---

##  Final Normalized Tables (3NF)
| Table | Primary Key | Description |
|--------|--------------|-------------|
| **User** | `user_id` | Stores user credentials and roles. |
| **Property** | `property_id` | Stores property details linked to hosts. |
| **Property_Amenities** | (`property_id`, `amenity_name`) | Lists individual amenities per property. |
| **Booking** | `booking_id` | Manages guest reservations for properties. |
| **Payment** | `payment_id` | Records payments for each booking. |
| **Review** | `review_id` | Captures user feedback for properties. |

---

##  Benefits of 3NF Design
- **Reduced redundancy:** Data like amenities and pricing details are stored only once.
- **Improved consistency:** Updates and deletions occur in one place without anomalies.
- **Optimized storage:** No duplicate or derived data fields.
- **Easier maintenance:** Logical structure simplifies schema updates and scaling.

---

##  Example Relationship Summary (3NF)
