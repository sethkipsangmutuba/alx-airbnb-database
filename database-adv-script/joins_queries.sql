-- INNER JOIN: Bookings with their respective users
SELECT b.booking_id, b.user_id, u.name AS user_name, b.property_id, b.booking_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
ORDER BY b.booking_id;

-- LEFT JOIN: Properties and their reviews (including properties with no reviews)
SELECT p.property_id, p.name AS property_name, r.review_id, r.rating
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.property_id;

-- Simulated FULL OUTER JOIN: All users and all bookings
SELECT u.user_id, u.name AS user_name, b.booking_id, b.property_id, b.booking_date
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
UNION
SELECT u.user_id, u.name AS user_name, b.booking_id, b.property_id, b.booking_date
FROM bookings b
LEFT JOIN users u ON u.user_id = b.user_id
ORDER BY user_id, booking_id;
