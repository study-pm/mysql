-- Setting the Database Name
SET @dbname = 'chess_tournaments';

-- Creating the SQL Query
SET @create = CONCAT('CREATE DATABASE IF NOT EXISTS `', @dbname, '`');

-- Preparing the Statement
PREPARE stmt FROM @create;

-- Executing the Statement
EXECUTE stmt;

-- Deallocating the Prepared Statement
DEALLOCATE PREPARE stmt;

USE chess_tournaments;
