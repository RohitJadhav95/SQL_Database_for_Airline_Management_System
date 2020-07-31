USE airline_management_system;

DROP TRIGGER IF EXISTS flights_audit_after_creation;

DELIMITER $$

CREATE TRIGGER flights_audit_after_creation
	AFTER INSERT ON flights
    FOR EACH ROW
BEGIN

	INSERT INTO flights_audit
    VALUES(
			NEW.Flight_Id,
            'INSERT',
            NOW(),
            NEW.Departure_Time,
            NEW.Departure_Date,
            NEW.Arrival_Time,
            NEW.Arrival_Date,
            NEW.Route_Id);
END$$

DELIMITER $$

DROP TRIGGER IF EXISTS flights_audit_after_deletion;

DELIMITER $$

CREATE TRIGGER flights_audit_after_deletion
	AFTER DELETE ON flights
    FOR EACH ROW
BEGIN

	INSERT INTO flights_audit
    VALUES(
			OLD.Flight_Id,
            'DELETE',
            NOW(),
            OLD.Departure_Time,
            OLD.Departure_Date,
            OLD.Arrival_Time,
            OLD.Arrival_Date,
            OLD.Route_Id);
END$$

DELIMITER $$

