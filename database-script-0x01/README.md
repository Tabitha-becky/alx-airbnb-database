# Airbnb Database Schema

This folder contains the database schema for an Airbnb-style application.

## Tables

1. **Users**
   - Stores information about hosts and guests.
   - `user_id` is the primary key.

2. **Properties**
   - Stores property listings.
   - Each property belongs to a host (`owner_id` → Users.user_id).
   - Indexed on `city` and `country` for search optimization.

3. **Bookings**
   - Stores reservations made by guests.
   - Links to `Properties` (`property_id`) and `Users` (`guest_id`).
   - `check_out` must be after `check_in`.

4. **Reviews**
   - Stores reviews left by guests for bookings.
   - Linked to `Bookings` (`booking_id`).
   - `rating` must be between 1 and 5.

5. **Payments**
   - Stores payment information for bookings.
   - Linked to `Bookings` (`booking_id`).

## Relationships

- `Properties.owner_id → Users.user_id`  
- `Bookings.property_id → Properties.property_id`  
- `Bookings.guest_id → Users.user_id`  
- `Reviews.booking_id → Bookings.booking_id`  
- `Payments.booking_id → Bookings.booking_id`
