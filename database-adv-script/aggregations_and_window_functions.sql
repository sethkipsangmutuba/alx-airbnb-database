-- Query 1: Total number of bookings made by each user
SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
    Booking
GROUP BY
    user_id
ORDER BY
    total_bookings DESC;

-- Query 2: Rank properties based on total bookings using window function
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM
    Booking
GROUP BY
    property_id
ORDER BY
    booking_rank;
