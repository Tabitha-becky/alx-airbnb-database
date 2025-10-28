-- Step 1: Monitor performance of a frequently used query
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

-- Step 2: Identify bottlenecks
-- The EXPLAIN ANALYZE output shows a sequential scan on the bookings table.

-- Step 3: Apply optimizations (create indexes)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Step 4: Test again after adding indexes
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
