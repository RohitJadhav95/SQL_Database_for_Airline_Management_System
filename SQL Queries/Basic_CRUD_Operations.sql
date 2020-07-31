USE airline_management_system;

# Creating a Booking for a given Passenger
INSERT INTO bookings
VALUES (DEFAULT, 'Economy', 10, 6, 3);

# Cancelling a Booking for a given Passenger
DELETE FROM bookings
WHERE Booking_Id = 302;

# Updating Passenger Information - Email
UPDATE passengers
SET Email = 'fstanley1@gravatar.com'
WHERE Passenger_Id = 1;

# Listing all the Flights for a given Route
SELECT *
FROM flights
WHERE Route_Id = 49017;

# Display the Airline information for a given Flight
SELECT a.Name, 
	   a.Code,
       a.Country
FROM flights f JOIN routes r
ON f.Route_Id = r.Route_Id
JOIN airlines a
ON r.Airline_Id = a.Airline_Id
WHERE f.Flight_Id = 5;