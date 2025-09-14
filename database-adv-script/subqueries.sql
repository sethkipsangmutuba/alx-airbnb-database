-- 1. Non-correlated subquery: properties with average rating > 4.0
SELECT *
FROM Properties
WHERE property_id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
ORDER BY property_id;

-- 2. Correlated subquery: users with more than 3 bookings
SELECT *
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3
ORDER BY user_id;
