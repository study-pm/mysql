-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema chess_tournaments
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema chess_tournaments
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `chess_tournaments` DEFAULT CHARACTER SET utf8 ;
USE `chess_tournaments` ;

-- -----------------------------------------------------
-- Table `chess_tournaments`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chess_tournaments`.`city` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Справочник городов';


-- -----------------------------------------------------
-- Table `chess_tournaments`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chess_tournaments`.`category` (
  `int` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`int`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chess_tournaments`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chess_tournaments`.`player` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(255) NOT NULL,
  `age` INT UNSIGNED NOT NULL,
  `gender` ENUM('m', 'f') NOT NULL,
  `city_id` INT UNSIGNED NOT NULL,
  `category_int` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_player_city_idx` (`city_id` ASC) VISIBLE,
  INDEX `fk_player_category1_idx` (`category_int` ASC) VISIBLE,
  CONSTRAINT `fk_player_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `chess_tournaments`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_category1`
    FOREIGN KEY (`category_int`)
    REFERENCES `chess_tournaments`.`category` (`int`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chess_tournaments`.`tournament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chess_tournaments`.`tournament` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `prize_amt` DOUBLE(10,2) NOT NULL,
  `holding_year` YEAR NOT NULL,
  `city_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tournament_city1_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_tournament_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `chess_tournaments`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chess_tournaments`.`participation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chess_tournaments`.`participation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` INT UNSIGNED NOT NULL,
  `tournament_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_participation_tournament1_idx` (`tournament_id` ASC) VISIBLE,
  INDEX `fk_participation_player1_idx` (`player_id` ASC) VISIBLE,
  CONSTRAINT `fk_participation_tournament1`
    FOREIGN KEY (`tournament_id`)
    REFERENCES `chess_tournaments`.`tournament` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participation_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `chess_tournaments`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `chess_tournaments`.`city`
-- -----------------------------------------------------
START TRANSACTION;
USE `chess_tournaments`;
INSERT INTO `chess_tournaments`.`city` (`id`, `name`) VALUES (DEFAULT, 'Москва');
INSERT INTO `chess_tournaments`.`city` (`id`, `name`) VALUES (DEFAULT, 'Санкт-Петербург');
INSERT INTO `chess_tournaments`.`city` (`id`, `name`) VALUES (DEFAULT, 'Новосибирск');
INSERT INTO `chess_tournaments`.`city` (`id`, `name`) VALUES (DEFAULT, 'Лондон');
INSERT INTO `chess_tournaments`.`city` (`id`, `name`) VALUES (DEFAULT, 'Баку');

COMMIT;


-- -----------------------------------------------------
-- Data for table `chess_tournaments`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `chess_tournaments`;
INSERT INTO `chess_tournaments`.`category` (`int`, `title`) VALUES (DEFAULT, 'чемпиона мира по шахматам');
INSERT INTO `chess_tournaments`.`category` (`int`, `title`) VALUES (DEFAULT, 'кмс');
INSERT INTO `chess_tournaments`.`category` (`int`, `title`) VALUES (DEFAULT, 'мастер спорта');
INSERT INTO `chess_tournaments`.`category` (`int`, `title`) VALUES (DEFAULT, '1 разряд');
INSERT INTO `chess_tournaments`.`category` (`int`, `title`) VALUES (DEFAULT, '2 разряд');
INSERT INTO `chess_tournaments`.`category` (`int`, `title`) VALUES (DEFAULT, 'чемпион РФ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `chess_tournaments`.`player`
-- -----------------------------------------------------
START TRANSACTION;
USE `chess_tournaments`;
INSERT INTO `chess_tournaments`.`player` (`id`, `full_name`, `age`, `gender`, `city_id`, `category_int`) VALUES (DEFAULT, 'Иванов Иван Иванович', 45, 'm', 1, 3);
INSERT INTO `chess_tournaments`.`player` (`id`, `full_name`, `age`, `gender`, `city_id`, `category_int`) VALUES (DEFAULT, 'Петров Петр Петрович', 75, 'm', 2, 2);
INSERT INTO `chess_tournaments`.`player` (`id`, `full_name`, `age`, `gender`, `city_id`, `category_int`) VALUES (DEFAULT, 'Сидорова Светлана Сергеевна', 30, 'f', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `chess_tournaments`.`tournament`
-- -----------------------------------------------------
START TRANSACTION;
USE `chess_tournaments`;
INSERT INTO `chess_tournaments`.`tournament` (`id`, `title`, `prize_amt`, `holding_year`, `city_id`) VALUES (DEFAULT, 'Чемпионат мира 2018', 150000, 2018, 4);
INSERT INTO `chess_tournaments`.`tournament` (`id`, `title`, `prize_amt`, `holding_year`, `city_id`) VALUES (DEFAULT, 'Чемпионат России 2019', 100000, 2019, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `chess_tournaments`.`participation`
-- -----------------------------------------------------
START TRANSACTION;
USE `chess_tournaments`;
INSERT INTO `chess_tournaments`.`participation` (`id`, `player_id`, `tournament_id`) VALUES (DEFAULT, 1, 1);
INSERT INTO `chess_tournaments`.`participation` (`id`, `player_id`, `tournament_id`) VALUES (DEFAULT, 2, 1);
INSERT INTO `chess_tournaments`.`participation` (`id`, `player_id`, `tournament_id`) VALUES (DEFAULT, 3, 2);

COMMIT;

