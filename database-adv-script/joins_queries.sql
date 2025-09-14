-- Query 1: INNER JOIN to get all bookings and their respective users
SELECT
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.first_name,
    users.last_name,
    users.email
FROM bookings
INNER JOIN users
    ON bookings.user_id = users.id;

-- Query 2: LEFT JOIN to get all properties and their reviews
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    properties.city,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews
    ON properties.id = reviews.property_id;

-- Query 3: FULL OUTER JOIN to get all users and all bookings
SELECT
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings
    ON users.id = bookings.user_id;

-- Simulate FULL OUTER JOIN in SQLite
SELECT
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
LEFT JOIN bookings
    ON users.id = bookings.user_id

UNION

SELECT
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
LEFT JOIN users
    ON users.id = bookings.user_id;
