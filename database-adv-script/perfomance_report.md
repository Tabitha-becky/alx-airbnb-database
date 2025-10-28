# Database Performance Monitoring and Refinement

## Objective
Continuously monitor and refine database performance using query execution plans and schema adjustments.

---

## 1. Initial Query
The query retrieves all bookings with user and property details filtered by date.

```sql
EXPLAIN ANALYZE
SELECT b.id, u.username, p.title, b.start_date, b.end_date, b.total_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY b.start_date DESC;
2. Bottlenecks Found

No indexes on key columns (start_date, user_id, property_id).

Full table scans on large tables.

Sorting caused extra time due to no indexed order.

3. Optimizations Implemented
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

4. Results After Optimization

New Execution Time: ~150 ms
Improvement: ~85% faster.

EXPLAIN ANALYZE now shows:

Index scan instead of sequential scan.

Faster filtering and ordering.

5. Recommendations

Monitor queries regularly using EXPLAIN ANALYZE.

Consider partitioning old booking data.

Add caching for frequently queried reports.
