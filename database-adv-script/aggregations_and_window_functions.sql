-- Query 1: Total bookings per user
SELECT 
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;

-- Query 2: Rank properties by total bookings using ROW_NUMBER()
WITH property_bookings AS (
    SELECT 
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM Properties p
    LEFT JOIN Bookings b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
)
SELECT 
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM property_bookings
ORDER BY booking_rank;
