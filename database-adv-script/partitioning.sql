-- Step 1: Create a partitioned version of the Bookings table based on start_date
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for each quarter of 2025
CREATE TABLE bookings_q1 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE bookings_q2 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE bookings_q3 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE bookings_q4 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Step 3: Insert data (example)
INSERT INTO bookings_partitioned (user_id, property_id, start_date, end_date, status)
VALUES (1, 101, '2025-02-10', '2025-02-15', 'confirmed'),
       (2, 105, '2025-05-12', '2025-05-15', 'pending');

-- Step 4: Query performance test (before and after partitioning)
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2025-04-01' AND '2025-06-01';
