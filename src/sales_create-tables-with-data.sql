-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sales
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sales` DEFAULT CHARACTER SET utf8 ;
USE `sales` ;

-- -----------------------------------------------------
-- Table `sales`.`sellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sales`.`sellers` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sname` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `comm` DECIMAL(3,2) NULL,
  PRIMARY KEY (`_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sales`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sales`.`customers` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `rating` INT(3) NULL,
  PRIMARY KEY (`_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sales`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sales`.`purchases` (
  `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `amt` DECIMAL(10,2) UNSIGNED NULL,
  `date` DATE NULL,
  `sellers__id` INT UNSIGNED NOT NULL,
  `customers__id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `fk_purchases_sellers1_idx` (`sellers__id` ASC) VISIBLE,
  INDEX `fk_purchases_customers1_idx` (`customers__id` ASC) VISIBLE,
  CONSTRAINT `fk_purchases_sellers1`
    FOREIGN KEY (`sellers__id`)
    REFERENCES `sales`.`sellers` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchases_customers1`
    FOREIGN KEY (`customers__id`)
    REFERENCES `sales`.`customers` (`_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sales`.`sellers`
-- -----------------------------------------------------
START TRANSACTION;
USE `sales`;
INSERT INTO `sales`.`sellers` (`_id`, `sname`, `city`, `comm`) VALUES (1, 'Peel', 'London', .12);
INSERT INTO `sales`.`sellers` (`_id`, `sname`, `city`, `comm`) VALUES (2, 'Serres', 'San Jose', .13);
INSERT INTO `sales`.`sellers` (`_id`, `sname`, `city`, `comm`) VALUES (3, 'Motika', 'London', .11);
INSERT INTO `sales`.`sellers` (`_id`, `sname`, `city`, `comm`) VALUES (4, 'Rifkin', 'Barcelona', .15);
INSERT INTO `sales`.`sellers` (`_id`, `sname`, `city`, `comm`) VALUES (5, 'Axelrod', 'New York', .10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sales`.`customers`
-- -----------------------------------------------------
START TRANSACTION;
USE `sales`;
INSERT INTO `sales`.`customers` (`_id`, `cname`, `city`, `rating`) VALUES (1, 'Hoffman', 'London', 100);
INSERT INTO `sales`.`customers` (`_id`, `cname`, `city`, `rating`) VALUES (2, 'Giovanni', 'Rome', 200);
INSERT INTO `sales`.`customers` (`_id`, `cname`, `city`, `rating`) VALUES (3, 'Liu', 'SanJose', 200);
INSERT INTO `sales`.`customers` (`_id`, `cname`, `city`, `rating`) VALUES (4, 'Grass', 'Berlin', 300);
INSERT INTO `sales`.`customers` (`_id`, `cname`, `city`, `rating`) VALUES (5, 'Clemens', 'London', 100);
INSERT INTO `sales`.`customers` (`_id`, `cname`, `city`, `rating`) VALUES (6, 'Cisneros', 'SanJose', 300);
INSERT INTO `sales`.`customers` (`_id`, `cname`, `city`, `rating`) VALUES (7, 'Pereira', 'Rome', 100);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sales`.`purchases`
-- -----------------------------------------------------
START TRANSACTION;
USE `sales`;
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (1, 18.69, '1990-10-10', 4, 6);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (2, 767.19, '1990-10-03', 1, 1);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (3, 1990.10, '1990-10-03', 4, 7);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (4, 5160.45, '1990-10-03', 2, 3);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (5, 1098.16, '1990-10-03', 4, 6);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (6, 1713.23, '1990-10-04', 5, 2);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (7, 75.75, '1990-10-04', 2, 4);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (8, 4723.00, '1990-10-05', 1, 5);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (9, 1309.95, '1990-10-06', 2, 4);
INSERT INTO `sales`.`purchases` (`_id`, `amt`, `date`, `sellers__id`, `customers__id`) VALUES (10, 9891.88, '1990-10-06', 1, 5);

COMMIT;

