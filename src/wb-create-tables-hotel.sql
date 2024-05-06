-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 ;
USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`comfort`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`comfort` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `type_name_UNIQUE` (`type_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`room` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(10) NOT NULL,
  `capacity` TINYINT UNSIGNED NOT NULL,
  `price` DECIMAL(3,2) NOT NULL,
  `phone_number` VARCHAR(10) NOT NULL,
  `comfort__id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `number_UNIQUE` (`number` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  INDEX `fk_room_comfort_idx` (`comfort__id` ASC) VISIBLE,
  CONSTRAINT `fk_room_comfort`
    FOREIGN KEY (`comfort__id`)
    REFERENCES `hotel`.`comfort` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`client` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(20) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `second_name` VARCHAR(20) NOT NULL,
  `passport_number` CHAR(10) NOT NULL,
  `birth_date` DATE NOT NULL,
  `address` VARCHAR(100) NULL,
  `comment` TEXT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `passport_number_UNIQUE` (`passport_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`discount` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(30) NOT NULL,
  `value` DECIMAL(3,2) UNSIGNED NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`client_discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`client_discount` (
  `_id` INT UNSIGNED NOT NULL,
  `client__id` INT UNSIGNED NOT NULL,
  `discount__id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_client_discount_client1_idx` (`client__id` ASC) VISIBLE,
  INDEX `fk_client_discount_discount1_idx` (`discount__id` ASC) VISIBLE,
  CONSTRAINT `fk_client_discount_client1`
    FOREIGN KEY (`client__id`)
    REFERENCES `hotel`.`client` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_discount_discount1`
    FOREIGN KEY (`discount__id`)
    REFERENCES `hotel`.`discount` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`phone` (
  `_int` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` CHAR(10) NULL,
  `client__id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`_int`),
  UNIQUE INDEX `number_UNIQUE` (`number` ASC) VISIBLE,
  INDEX `fk_phone_client1_idx` (`client__id` ASC) VISIBLE,
  CONSTRAINT `fk_phone_client1`
    FOREIGN KEY (`client__id`)
    REFERENCES `hotel`.`client` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`reservation` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` DATE NOT NULL,
  `leave_date` DATE NOT NULL,
  `room__id` INT UNSIGNED NOT NULL,
  `client__id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_reservation_room1_idx` (`room__id` ASC) VISIBLE,
  INDEX `fk_reservation_client1_idx` (`client__id` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_room1`
    FOREIGN KEY (`room__id`)
    REFERENCES `hotel`.`room` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_client1`
    FOREIGN KEY (`client__id`)
    REFERENCES `hotel`.`client` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`checkin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`checkin` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` DATE NOT NULL,
  `leave_date` VARCHAR(45) NOT NULL,
  `room__id` INT UNSIGNED NOT NULL,
  `client__id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `date_ts_UNIQUE` (`date_ts` ASC) VISIBLE,
  INDEX `fk_checkin_room1_idx` (`room__id` ASC) VISIBLE,
  INDEX `fk_checkin_client1_idx` (`client__id` ASC) VISIBLE,
  CONSTRAINT `fk_checkin_room1`
    FOREIGN KEY (`room__id`)
    REFERENCES `hotel`.`room` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_checkin_client1`
    FOREIGN KEY (`client__id`)
    REFERENCES `hotel`.`client` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
