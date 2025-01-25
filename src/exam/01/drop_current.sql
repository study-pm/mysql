-- Creating the SQL Query
SET @q = CONCAT('DROP DATABASE IF EXISTS ', DATABASE(), ';');

-- Preparing the Statement
PREPARE stmt FROM @q;

-- Executing the Statement
EXECUTE stmt;

-- Deallocating the Prepared Statement
DEALLOCATE PREPARE stmt;
