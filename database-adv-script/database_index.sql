-- =========================================
-- Indexes for optimizing Airbnb database queries
-- =========================================

-- Users table: index on email for faster lookups by email
CREATE INDEX idx_users_email ON Users(email);

-- Properties table: index on location for faster filtering by location
CREATE INDEX idx_properties_location ON Properties(location);

-- Bookings table: indexes on foreign keys and booking date for joins and date-based queries
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON Bookings(booking_date);

-- =========================================
-- Measure query performance BEFORE and AFTER indexes
-- =========================================

-- Example: Check how a user query performs
EXPLAIN ANALYZE 
SELECT * FROM Users WHERE email = 'example@example.com';

-- Example: Check how a property query performs
EXPLAIN ANALYZE 
SELECT * FROM Properties WHERE location = 'Nairobi';

-- Example: Check how a booking query performs with joins
EXPLAIN ANALYZE 
SELECT b.booking_id, u.name, p.name
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
WHERE b.booking_date > '2025-01-01';
