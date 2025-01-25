/* CRUD */

-- Create a service
DELIMITER //
CREATE PROCEDURE AddService(
    IN service_title VARCHAR(127),
    IN service_rate DECIMAL(10, 2),
    OUT created_id INT UNSIGNED
)

DECLARE affected_rows INT UNSIGNED DEFAULT 0;

BEGIN
    CREATE EXIT HANDLER FOR 1062
    BEGIN
        SELECT CONCAT("Duplicate entry for '", service_title, "'") AS `Error (duplicate)`;
    END;
END//

DELIMITER ;

