USE airline_management_system;

CREATE INDEX idx_destination_city ON airports (City);

CREATE INDEX idx_departure_date ON flights (Departure_Date);

