-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Airline_Management_System
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Airline_Management_System
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Airline_Management_System` DEFAULT CHARACTER SET utf8 ;
USE `Airline_Management_System` ;

-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Airlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Airlines` (
  `Airline_Id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Code` VARCHAR(5) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`Airline_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Airports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Airports` (
  `Airport_Id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Counntry` VARCHAR(45) NULL,
  `Code` VARCHAR(5) NULL,
  PRIMARY KEY (`Airport_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Routes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Routes` (
  `Route_Id` INT NOT NULL,
  `Airline_Id` INT NULL,
  `Departure_Airport_Id` INT NULL,
  `Arrival_Airport_Id` INT NULL,
  PRIMARY KEY (`Route_Id`),
  INDEX `fk_Airline_Id_idx` (`Airline_Id` ASC) VISIBLE,
  INDEX `fk_Departure_Airport_Id_idx` (`Departure_Airport_Id` ASC) VISIBLE,
  INDEX `fk_Arrival_Airport_Id_idx` (`Arrival_Airport_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Airline_Id`
    FOREIGN KEY (`Airline_Id`)
    REFERENCES `Airline_Management_System`.`Airlines` (`Airline_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Departure_Airport_Id`
    FOREIGN KEY (`Departure_Airport_Id`)
    REFERENCES `Airline_Management_System`.`Airports` (`Airport_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Arrival_Airport_Id`
    FOREIGN KEY (`Arrival_Airport_Id`)
    REFERENCES `Airline_Management_System`.`Airports` (`Airport_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Flights` (
  `Flight_Id` INT NOT NULL,
  `Departure_Time` TIME NULL,
  `Departure_Date` DATE NULL,
  `Arrival_Time` TIME NULL,
  `Arrival_Date` DATE NULL,
  `Route_Id` INT NULL,
  PRIMARY KEY (`Flight_Id`),
  INDEX `fk_Route_Id_idx` (`Route_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Route_Id`
    FOREIGN KEY (`Route_Id`)
    REFERENCES `Airline_Management_System`.`Routes` (`Route_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Passengers` (
  `Passenger_Id` INT NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Passengerscol` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Age` INT NULL,
  PRIMARY KEY (`Passenger_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Bookings` (
  `Booking_Id` INT NOT NULL,
  `Class` VARCHAR(45) NULL,
  `Seat_Number` INT NULL,
  `Flight_Id` INT NULL,
  `Passenger_Id` INT NULL,
  PRIMARY KEY (`Booking_Id`),
  INDEX `fk_Flight_Id_idx` (`Flight_Id` ASC) VISIBLE,
  INDEX `fk_Passenger_Id_idx` (`Passenger_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Flight_Id`
    FOREIGN KEY (`Flight_Id`)
    REFERENCES `Airline_Management_System`.`Flights` (`Flight_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Passenger_Id`
    FOREIGN KEY (`Passenger_Id`)
    REFERENCES `Airline_Management_System`.`Passengers` (`Passenger_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Pilots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Pilots` (
  `Pilot_Id` INT NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Experience` INT NULL,
  PRIMARY KEY (`Pilot_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airline_Management_System`.`Flight_Pilot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airline_Management_System`.`Flight_Pilot` (
  `Flight_Id` INT NOT NULL,
  `Pilot_Id` INT NOT NULL,
  PRIMARY KEY (`Flight_Id`, `Pilot_Id`),
  INDEX `fk_Pilot_Id_idx` (`Pilot_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Flight_Id2`
    FOREIGN KEY (`Flight_Id`)
    REFERENCES `Airline_Management_System`.`Flights` (`Flight_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Pilot_Id`
    FOREIGN KEY (`Pilot_Id`)
    REFERENCES `Airline_Management_System`.`Pilots` (`Pilot_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
