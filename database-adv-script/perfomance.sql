-- Initial query: Retrieve all bookings with user, property, and payment details
-- Filtered example to include WHERE and AND
SELECT b.booking_id,
       u.user_id, u.name AS user_name,
       p.property_id, p.name AS property_name,
       pay.amount, pay.payment_date
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND pay.amount > 0;

-- Refactored query: optimized by selecting only required columns
SELECT b.booking_id,
       u.user_id, u.name AS user_name,
       p.property_id, p.name AS property_name,
       pay.amount
FROM Booking b
JOIN Users u USING(user_id)
JOIN Property p USING(property_id)
JOIN Payment pay USING(booking_id)
WHERE b.start_date >= '2025-01-01'
  AND pay.amount > 0;

-- Analyze query performance
EXPLAIN ANALYZE
SELECT b.booking_id,
       u.user_id, u.name AS user_name,
       p.property_id, p.name AS property_name,
       pay.amount
FROM Booking b
JOIN Users u USING(user_id)
JOIN Property p USING(property_id)
JOIN Payment pay USING(booking_id)
WHERE b.start_date >= '2025-01-01'
  AND pay.amount > 0;
