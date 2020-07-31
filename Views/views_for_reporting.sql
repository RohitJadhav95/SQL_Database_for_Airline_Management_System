Use airline_management_system;


# Number of passengers in Economy and First Class for a given Airline

CREATE OR REPLACE VIEW class_passenges_for_airlines AS

SELECT	a.Name AS 'Airlines',
		b.class AS 'Class',
		Count(b.Passenger_Id) AS 'Number of Passengers'
FROM airlines a JOIN routes r
ON a.Airline_Id = r.Airline_Id
JOIN flights f 
ON r.Route_Id = f.Route_Id
JOIN bookings b
ON f.Flight_Id = b.Flight_Id
GROUP BY a.Name, b.class
HAVING a.Name = 'Southwest Airlines';

# Flights with longest duration

CREATE OR REPLACE VIEW duration_for_flights AS

SELECT 	Flight_Id,
		timestampdiff(MINUTE, Departure_Time, Arrival_Time) AS Time_Difference
FROM flights
GROUP BY Flight_Id
ORDER BY Time_Difference DESC;


# Pilots with the most passengers for different fights

CREATE OR REPLACE VIEW passengers_for_pilots AS

SELECT 	p.Pilot_Id,
		f.Flight_Id,
		COUNT(*) AS Number_of_Passengers
FROM bookings b JOIN flights f
on b.Flight_Id = f.Flight_Id
JOIN flight_pilot p
on p.Flight_Id = f.Flight_Id
GROUP BY Pilot_Id, f.Flight_Id
ORDER BY Number_of_Passengers DESC;

 

