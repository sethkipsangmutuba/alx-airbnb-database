# Database Performance Monitoring Report

## Queries Monitored
- Total bookings per user
- Properties ranked by total bookings
- Bookings in specific date ranges

## Monitoring Method
- Used `EXPLAIN ANALYZE` for queries to check execution plans.
- Observed which queries are scanning large numbers of rows or performing sequential scans.

## Identified Bottlenecks
- Queries filtering by `user_id` and `property_id` were slower due to missing indexes.
- Aggregation queries on the `Booking` table were slower before partitioning.

## Actions Taken
- Added indexes on frequently used columns: `user_id`, `property_id`, `start_date`.
- Partitioned the `Booking` table by `start_date` to reduce full table scans.
- Optimized queries to avoid unnecessary joins.

## Results / Improvements
- Queries using `WHERE user_id` or `property_id` now use indexes.
- Partitioned table queries are faster due to reduced row scanning.
- Aggregation queries using `GROUP BY` perform significantly better.

