# Partitioning Performance Report

## Partitioning Strategy
- The `Booking` table was partitioned by `start_date` into quarterly ranges for 2025.
- Queries filtering by date now scan only the relevant partition.

## Query Performance
**Before Partitioning:** Full table scan, slow for large datasets.  
**After Partitioning:** Only relevant partition scanned, significantly faster.

## Observations
- Queries using `WHERE start_date` improved in execution time.
- Indexes can be applied to each partition for further optimization.
- Partitioning reduces I/O and improves scalability for large tables.
