# Partitioning Performance Report

## 1. Objective
The goal was to improve query performance on the large **Bookings** table by implementing **table partitioning** based on the `start_date` column.

---

## 2. Implementation
The table was partitioned by **RANGE** into four quarterly partitions:
- Q1: January – March
- Q2: April – June
- Q3: July – September
- Q4: October – December

Each partition stores bookings only within its date range.

---

## 3. Performance Test

### Before Partitioning
Query:
```sql
EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date BETWEEN '2025-04-01' AND '2025-06-01';
Execution time: ~450ms

Full table scan performed.

After Partitioning

Query:

EXPLAIN ANALYZE SELECT * FROM bookings_partitioned WHERE start_date BETWEEN '2025-04-01' AND '2025-06-01';


Execution time: ~120ms

Only Q2 partition scanned.

Reduced I/O and improved performance.

4. Observations

Queries filtered by start_date run ~3–4× faster.

Maintenance and backup operations simplified.

Indexing within partitions further improves speed.
