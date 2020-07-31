USE airline_management_system;

DROP EVENT IF EXISTS yearly_delete_flights_logs;

DELIMITER $$

CREATE EVENT yearly_delete_flights_logs
ON SCHEDULE 
	EVERY 1 YEAR STARTS '2020-08-01' ENDS '2030-07-31'
DO BEGIN
	DELETE FROM flights_audit	
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END$$

DELIMITER ;



