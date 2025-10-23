# Database Normalization for Airbnb Schema

## Objective
Apply normalization principles to ensure the Airbnb database schema is in Third Normal Form (3NF).

## Original Schema Issues
- Guests and hosts information repeated in the bookings table.
- Property address depends on property name (transitive dependency).
- Multiple guests or properties in the same row (violates 1NF).

## Normalization Steps

1. **First Normal Form (1NF)**  
   - Split repeating groups into separate rows.
   - Ensure each column contains atomic values.

2. **Second Normal Form (2NF)**  
   - Remove partial dependencies on composite keys.
   - Assign separate IDs (GuestID, HostID, PropertyID) to reduce redundancy.

3. **Third Normal Form (3NF)**  
   - Remove transitive dependencies.
   - Move attributes like `PropertyAddress` to the `Properties` table.

## Final 3NF Schema

**Guests**: GuestID, GuestName, GuestEmail  
**Hosts**: HostID, HostName, HostEmail  
**Properties**: PropertyID, PropertyName, PropertyAddress, HostID  
**Bookings**: BookingID, GuestID, PropertyID, CheckIn, CheckOut

This design eliminates redundancy, ensures data integrity, and is fully compliant with 3NF.
