/* CRUD */

-- Create a genre
DELIMITER //

CREATE PROCEDURE AddGenre(IN title VARCHAR(63), OUT added_id INT UNSIGNED)
BEGIN
    DECLARE affected_rows INT UNSIGNED DEFAULT 0;

    DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SELECT CONCAT("Duplicate entry for '", title, "'") AS `Error (duplicate)`;
    END;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT CONCAT("Error adding the genre ", title) AS `Error (unexpected)`;
    END;

    INSERT INTO genre VALUE (DEFAULT, title);
    SET affected_rows = ROW_COUNT();    
    SET added_id = LAST_INSERT_ID();
    SELECT CONCAT("Successfully added the genre '", title, "' with ID: ", added_id) AS Success;

END//

DELIMITER ;

CALL AddGenre('фантастика', @created_id);

SELECT @created_id;

DROP PROCEDURE AddGenre;
