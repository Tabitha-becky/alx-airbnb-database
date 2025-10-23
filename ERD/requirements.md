# 🧩 Entity-Relationship Diagram (ERD)

## Objective
This ERD represents the database structure for the **Airbnb Clone Project**, outlining key entities and their relationships. It helps visualize how users interact with properties, bookings, payments, and reviews in the system.

---

## 🧱 Key Entities and Attributes

### 1. User
- `user_id` (Primary Key)
- `name`
- `email`
- `phone_number`
- `password`
- `date_joined`

**Description:** Stores user information including both guests and hosts.

---

### 2. Property
- `property_id` (Primary Key)
- `user_id` (Foreign Key → User)
- `title`
- `location`
- `price_per_night`
- `property_type`
- `status`

**Description:** Contains details of all properties listed by hosts.

---

### 3. Booking
- `booking_id` (Primary Key)
- `user_id` (Foreign Key → User)
- `property_id` (Foreign Key → Property)
- `check_in_date`
- `check_out_date`
- `total_price`
- `booking_status`

**Description:** Represents reservations made by users for specific properties.

---

### 4. Review
- `review_id` (Primary Key)
- `user_id` (Foreign Key → User)
- `property_id` (Foreign Key → Property)
- `rating`
- `comment`
- `created_at`

**Description:** Stores feedback left by users about properties they booked.

---

### 5. Payment
- `payment_id` (Primary Key)
- `booking_id` (Foreign Key → Booking)
- `amount`
- `payment_date`
- `payment_method`
- `payment_status`

**Description:** Tracks payment transactions for completed bookings.

---

## 🔗 Relationships
- A **User** can list multiple **Properties**.  
- A **User** can make multiple **Bookings**.  
- Each **Booking** belongs to one **Property** and one **User**.  
- A **Property** can have multiple **Reviews**.  
- Each **Payment** is linked to one **Booking**.

---

## 🖼️ ER Diagram (Visual)
<img width="522" height="701" alt="ERD" src="https://github.com/user-attachments/assets/1466f1bd-f533-4f19-bef1-25b3de53dd6d" />


