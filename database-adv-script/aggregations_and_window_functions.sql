-- 1. Total number of bookings per user
SELECT 
    u.user_id,
    u.name,
    COUNT(b.booking_id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;

-- 2. Rank properties based on total bookings using window function
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Properties p
LEFT JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;
