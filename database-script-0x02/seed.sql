-- seed.sql
-- Insert sample data into Airbnb database

-- 1. Users
INSERT INTO Users (first_name, last_name, email, password, phone_number)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'password123', '0712345678'),
('Bob', 'Smith', 'bob@example.com', 'password123', '0723456789'),
('Charlie', 'Brown', 'charlie@example.com', 'password123', '0734567890');

-- 2. Properties
INSERT INTO Properties (owner_id, title, description, address, city, country, price_per_night, max_guests)
VALUES
(1, 'Cozy Apartment', 'A nice and cozy apartment in downtown.', '123 Main St', 'Nairobi', 'Kenya', 50.00, 2),
(2, 'Beach House', 'Beautiful beach house with ocean view.', '456 Ocean Dr', 'Mombasa', 'Kenya', 120.00, 6),
(1, 'Mountain Cabin', 'Rustic cabin in the mountains.', '789 Hill Rd', 'Nairobi', 'Kenya', 80.00, 4);

-- 3. Bookings
INSERT INTO Bookings (property_id, guest_id, check_in, check_out, total_price)
VALUES
(1, 2, '2025-11-01', '2025-11-05', 200.00),
(2, 3, '2025-12-10', '2025-12-15', 600.00),
(3, 2, '2025-11-20', '2025-11-22', 160.00);

-- 4. Reviews
INSERT INTO Reviews (booking_id, rating, comment)
VALUES
(1, 5, 'Great apartment, very clean!'),
(2, 4, 'Lovely beach house, but a bit far from the town.'),
(3, 5, 'Perfect cabin, loved the view!');

-- 5. Payments
INSERT INTO Payments (booking_id, amount, payment_method)
VALUES
(1, 200.00, 'Credit Card'),
(2, 600.00, 'M-Pesa'),
(3, 160.00, 'Cash');
