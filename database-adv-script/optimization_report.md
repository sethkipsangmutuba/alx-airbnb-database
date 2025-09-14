## Task 4: Optimize Complex Queries

### Objective
Refactor complex queries to improve database performance.

### Initial Query
The initial query joined Booking, Users, Property, and Payment tables and selected all columns.

### Analysis
Using `EXPLAIN ANALYZE`, we observed:
- Multiple full table scans.
- Joins on large tables causing delays.

### Refactored Query
- Only necessary columns are selected.
- Simplified JOINs using `USING`.
- Recommended indexes: `Booking(user_id, property_id)`, `Payment(booking_id)`.

### Improvements
- Reduced execution time.
- Lowered memory usage.
- Faster response for frequent queries.
