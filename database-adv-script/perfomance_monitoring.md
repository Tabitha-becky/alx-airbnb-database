# Database Performance Monitoring and Refinement

## Objective
Continuously monitor and refine database performance using query execution plans and schema adjustments.

---

## 1. Initial Query
The query retrieves all bookings with user and property details filtered by date.

```sql
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.username,
    p.title AS property_title,
    b.start_date,
    b.end_date,
    b.total_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY b.start_date DESC;


