-- schema.sql
-- Airbnb Database Schema

-- 1. Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Properties Table
CREATE TABLE Properties (
    property_id SERIAL PRIMARY KEY,
    owner_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    max_guests INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Index for city/country search
CREATE INDEX idx_properties_city_country ON Properties(city, country);

-- 3. Bookings Table
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    guest_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (guest_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_dates CHECK (check_out > check_in)
);

-- 4. Reviews Table
CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);

-- 5. Payments Table
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);

-- Optional indexes
CREATE INDEX idx_bookings_guest ON Bookings(guest_id);
CREATE INDEX idx_bookings_property ON Bookings(property_id);
CREATE INDEX idx_payments_booking ON Payments(booking_id);
