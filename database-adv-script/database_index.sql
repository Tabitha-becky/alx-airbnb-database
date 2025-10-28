-- Create indexes to improve performance in frequently queried columns

-- 1️⃣ User table: index on email (commonly used in login queries)
CREATE INDEX idx_users_email
ON users (email);

-- 2️⃣ Bookings table: index on user_id and property_id (used in JOINs)
CREATE INDEX idx_bookings_user_id
ON bookings (user_id);

CREATE INDEX idx_bookings_property_id
ON bookings (property_id);

-- 3️⃣ Properties table: index on location and price (used in filters)
CREATE INDEX idx_properties_location
ON properties (location);

CREATE INDEX idx_properties_price
ON properties (price);

-- Optional: check performance improvement
-- Example: EXPLAIN SELECT * FROM bookings WHERE user_id = 5;
