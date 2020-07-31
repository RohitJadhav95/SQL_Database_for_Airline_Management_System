USE airline_management_system;


# Create and Delete Booking for a Passenger

DROP PROCEDURE IF EXISTS create_booking;

DELIMITER $$

CREATE PROCEDURE create_booking(
	IN Flight_Id INT,
	IN Seat_Number VARCHAR(45),
	IN Class VARCHAR(45),
	IN Passenger_Id INT)
BEGIN

	INSERT INTO bookings (Flight_Id, Seat_Number, Class, Passenger_Id)
    VALUES(FLight_Id, Seat_Number, Class, Passenger_Id);
    
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS cancel_booking;

DELIMITER $$

CREATE PROCEDURE cancel_booking(
	IN Flight_Id INT,
	IN Seat_Number VARCHAR(45),
	IN Class VARCHAR(45),
	IN Passenger_Id INT)
BEGIN

    DELETE FROM bookings b
	WHERE b.Flight_Id = FLight_ID AND
    b.Seat_Number = Seat_Number AND
    b.Class = Class AND
    b.Passenger_Id = Passenger_Id;
    
END$$

DELIMITER ;


# List of flights to specific destination

DROP PROCEDURE IF EXISTS get_flights_by_destination;

DELIMITER $$

CREATE PROCEDURE get_flights_by_destination(
	IN Destination VARCHAR(45))
BEGIN

	SELECT 	Flight_Id, 
			Departure_Date, 
            Departure_Time, 
            Arrival_Time, 
            a1.city AS 'City of Departure', 
            a2.city AS 'City of Arrival'
	FROM flights f JOIN routes r
    ON f.Route_Id = r.Route_Id 
    JOIN airports a1
    ON r.Departure_Airport_Id =  a1.Airport_Id 
    JOIN airports a2
    ON r.Arrival_Airport_Id =  a2.Airport_Id
	WHERE A2.City = Destination;
    
END$$

DELIMITER ;

# List of flights on a specific date

DROP PROCEDURE IF EXISTS get_flights_by_date;

DELIMITER $$

CREATE PROCEDURE get_flights_by_date(
	IN entered_date VARCHAR(45))
BEGIN

	SELECT 	Departure_Date, 
			a1.Name AS Origin, 
			a1.Code AS Origin_Code, 
            Departure_Time, 
			a2.Name AS Destination, 
            a2.Code AS Destination_Code, 
            Arrival_Time, 
			a.Name AS Airline
	FROM flights f JOIN routes r
    ON f.Route_Id = r.Route_Id
    JOIN airports a1
    ON r.Departure_Airport_Id = a1.Airport_Id
    JOIN airports a2
    ON r.Departure_Airport_Id = a2.Airport_Id
    JOIN airlines a
    ON r.Airline_Id = a.Airline_Id
	WHERE Departure_Date = entered_date;
  
END$$

DELIMITER ;
