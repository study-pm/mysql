/* Создать хранимую процедуру для поиска данных двух блюд, цена которых будет равна введенному значению. Цена вводится как параметр. */

DELIMITER //

CREATE PROCEDURE AddModel (IN model_title VARCHAR(63), OUT added_id INT UNSIGNED)
BEGIN

    DECLARE res VARCHAR(63);
    DECLARE msg TINYTEXT;

    DECLARE EXIT HANDLER FOR SQLERROR
    BEGIN
        SELECT "Error adding"
    END;
    
    INSERT INTO model VALUES(DEFAULT, model_title);

    IF ROW_COUNT() > 0 THEN
        SET added_id = LAST_INSERT_ID();
        SELECT "Added" INTO res;
        SELECT CONCAT("Successfully added the entry '", model_title, "'") INTO msg;
    ELSE
        SELECT "Not added" INTO res;
        SELECT CONCAT("Error adding the entry '", model_title, "'") INTO msg;
    END IF;

    SELECT res AS Result, msg AS Message, added_id AS ID;

END//

DELIMITER ;