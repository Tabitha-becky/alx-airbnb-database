-- Initial query (before optimization)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.username,
    u.email,
    p.title AS property_name,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.status = 'completed';

-- Refactored (optimized) query
-- Removed unnecessary columns and ensured indexed columns are used in joins
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.username,
    p.title AS property_name,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.status = 'completed';
