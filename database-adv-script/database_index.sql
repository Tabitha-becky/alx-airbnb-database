-- Create indexes to improve performance

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);

-- Measure performance before and after using EXPLAIN ANALYZE

EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 5;
EXPLAIN ANALYZE SELECT * FROM properties WHERE location = 'Nairobi';
