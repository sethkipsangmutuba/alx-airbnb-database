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
