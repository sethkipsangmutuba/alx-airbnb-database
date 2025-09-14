# Index Performance Analysis

## Tables Indexed
- Users table: indexed `id`, `email`
- Properties table: indexed `id`, `location`
- Bookings table: indexed `id`, `user_id`, `property_id`, `booking_date`

## Query Performance Before Indexes
Example using EXPLAIN:

```sql
EXPLAIN SELECT * FROM Bookings WHERE user_id = 5;
