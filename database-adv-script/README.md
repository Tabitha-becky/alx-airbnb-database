# SQL Joins Queries

## Objective
Practice using different types of SQL joins to query multiple related tables in the Airbnb database.

## Queries Included
1. **INNER JOIN** – Retrieve all bookings and the respective users who made those bookings.  
2. **LEFT JOIN** – Retrieve all properties and their reviews, including those without reviews.  
3. **FULL OUTER JOIN** – Retrieve all users and all bookings, even if they are not linked.

## Files
- `joins_queries.sql` — Contains the SQL join queries.
- `README.md` — This documentation file.

## Author
Becky Nyongesa
## Subqueries

### 1. Non-Correlated Subquery
Find all properties where the average rating is greater than 4.0.

### 2. Correlated Subquery
Find all users who have made more than 3 bookings.

### File
- `subqueries.sql` — Contains both correlated and non-correlated subquery examples.
## Aggregations and Window Functions

### 1. Aggregation Query
Find the total number of bookings made by each user using `COUNT()` and `GROUP BY`.

### 2. Window Function Query
Rank properties based on the total number of bookings they have received using `RANK()`.

### File
- `aggregations_and_window_functions.sql` — Contains both queries.
