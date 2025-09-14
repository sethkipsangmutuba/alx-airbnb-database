-- Create parent partitioned table
CREATE TABLE Booking_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount NUMERIC(10,2)
) PARTITION BY RANGE (start_date);

-- Create partitions for different ranges
CREATE TABLE Booking_2025_Q1 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-03-31');

CREATE TABLE Booking_2025_Q2 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-04-01') TO ('2025-06-30');

CREATE TABLE Booking_2025_Q3 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-07-01') TO ('2025-09-30');

CREATE TABLE Booking_2025_Q4 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-10-01') TO ('2025-12-31');

-- Query bookings in Q2
EXPLAIN ANALYZE
SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2025-04-01' AND '2025-06-30';

