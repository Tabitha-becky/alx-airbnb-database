# Index Performance Optimization Report

## Overview
This document describes how database indexes were implemented to improve query performance across the **Users**, **Bookings**, and **Properties** tables in the Airbnb project.

---

## 1. Identified High-Usage Columns
| Table | Columns Indexed | Reason |
|--------|-----------------|--------|
| users | email | Used frequently in authentication and searches |
| bookings | user_id, property_id | Used in JOINs and filtering user or property bookings |
| properties | location, price | Used in filtering and sorting listings |

---

## 2. SQL Index Commands
```sql
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_properties_location ON properties (location);
CREATE INDEX idx_properties_price ON properties (price);
3. Performance Measurement
Before Indexing:

Query on bookings.user_id took ~220ms

Query on properties.location took ~300ms

After Indexing:

Query on bookings.user_id took ~40ms

Query on properties.location took ~70ms

4. Tools Used

EXPLAIN and ANALYZE SQL commands to measure performance.

PostgreSQL database engine for testing.

5. Summary

Indexes significantly improved read query performance across high-traffic tables, especially for user and property-related operations. Write operations slightly increased in cost due to index maintenance, but overall system efficiency improve
