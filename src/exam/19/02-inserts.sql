INSERT INTO car_trips.brand (title) VALUES
    ('Toyota'),
    ('Skoda'),
    ('Mercedes-Benz'),
    ('BMW'),
    ('Honda')
;


INSERT INTO car_trips.station (title) VALUES 
    ('Москва'), 
    ('Санкт-Петербург'), 
    ('Казань')
;

INSERT INTO driver (full_name, category, experience) VALUES 
    ('Иванов Иван Иванович', 'B', 6),
    ('Петров Петр Петрович', 'C', 4),
    ('Сидоров Сидор Сидорович', 'B', 8),
    ('Алексеев Алексей Алексеевич', 'D', 3)
;

INSERT INTO car (license_plate, manufacture_year, brand_id, driver_id) VALUES 
    ('а123вс01', 2015, 1, 4), 
    ('в456де22', 2018, 3, 3), 
    ('с789фг133', 2010, 2, 2), 
    ('д012гх777', 2010, 3, 1)
;

INSERT INTO trip (departure_date, return_date, destination_id, car_id, initial_mileage, final_mileage) VALUES 
    ('2025-01-10', '2025-01-12', 1, 4, 50000, 51000), 
    ('2025-01-15', '2025-01-17', 2, 3, 30000, 31500), 
    ('2025-01-20', '2025-01-22', 3, 2, 52000, 53000)
;

DELIMITER //

CREATE PROCEDURE AddBrand(IN brand_title VARCHAR(31), OUT added_id INT UNSIGNED)
BEGIN

    DECLARE duplicate_entry CONDITION FOR 1062;
    
    DECLARE CONTINUE HANDLER FOR duplicate_entry
    BEGIN
        SELECT
            "Not added" AS Result,
            "Duplicate entry" AS Reason,
            brand_title AS Title
        ;
    END;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
         -- Declare variables to hold error information
        DECLARE v_sqlstate CHAR(5);
        DECLARE v_errno INT;
        DECLARE v_message TEXT;

        -- Get diagnostics information
        GET DIAGNOSTICS CONDITION 1
            v_sqlstate = RETURNED_SQLSTATE,
            v_errno = MYSQL_ERRNO,
            v_message = MESSAGE_TEXT;

        -- You can log the error or handle it as needed
        SELECT CONCAT('SQLSTATE: ', v_sqlstate, ', Error Number: ', v_errno, ', Message: ', v_message) AS error_info;
    END;

    INSERT INTO brand VALUE (DEFAULT, brand_title);
    SET added_id = LAST_INSERT_ID();
    SELECT 
        "Successfully added" AS Result,
        brand_title AS Title,
        added_id AS ID
    ;

END//

DELIMITER ;

CALL AddBrand('Skoda', @created_id);

SELECT @created_id AS `Created ID`;

DROP PROCEDURE AddBrand;

DELIMITER //

CREATE PROCEDURE GetBrandId (IN brand_title VARCHAR(63), OUT found_id INT UNSIGNED)
BEGIN

    DECLARE result ENUM ('Error', 'Not found', 'Success');
    DECLARE msg TEXT;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
        SET result = 'Not found';
        SET found_id = NULL;
        SELECT "The entry not found" INTO msg;
    END;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET result = 'Error';
        SET found_id = NULL;
        SELECT "An error occurred";
    END;
    
    SELECT id INTO found_id FROM brand WHERE title = brand_title;

    IF found_id IS NOT NULL THEN
        SET result = 'Success';
        SELECT "The entry found" INTO msg;
    ELSE 
        SELECT "The entry not found" INTO msg;
    END IF;    

    SELECT result AS Result, msg AS Message, found_id AS Found;

END//

DELIMITER ;

CALL GetBrandId('Skoda', @found);
SELECT @found AS "Found id";
DROP PROCEDURE GetBrandId;

DELIMITER //

CREATE PROCEDURE UpdateBrand(IN brand_id INT UNSIGNED, IN brand_title VARCHAR(31), OUT changed_id INT UNSIGNED)
BEGIN
    
    DECLARE previous_title VARCHAR(31);

    DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        SELECT CONCAT("The entry with ID ", brand_id, " not found") AS `Not found`;
    END;

    -- Retrieve the current title before updating
    SELECT title INTO previous_title FROM brand WHERE id = brand_id;
    
    UPDATE brand
        SET title = brand_title
        WHERE id = brand_id;

    IF ROW_COUNT() > 0 THEN
        -- Output success message with previous and new values
        SELECT CONCAT('Successfully updated the entry "', previous_title, '" to "', brand_title, '"') AS Success;
    ELSE
        SELECT 'No update was made.' AS `Not updated`;
    END IF;

END//

DELIMITER ;

CALL UpdateBrand(5, 'Merc', @updated_id);

DROP PROCEDURE UpdateBrand;

DELIMITER //

CREATE PROCEDURE DeleteBrand(IN brand_id INT UNSIGNED, OUT deleted_id INT UNSIGNED)
BEGIN
        
    DECLARE affected_rows INT UNSIGNED DEFAULT 0;
    DECLARE result VARCHAR(63);
    DECLARE msg TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        DECLARE v_sqlstate CHAR(5);
        DECLARE v_errno INT;
        DECLARE v_message TEXT;
        GET DIAGNOSTICS CONDITION 1 
            v_sqlstate = RETURNED_SQLSTATE,
            v_errno = MYSQL_ERRNO,
            v_message = MESSAGE_TEXT;

        SELECT
            v_sqlstate AS `SQL State`,
            v_errno AS `Error Code`,
            v_message AS "Error message";
    END;
    
    DELETE FROM brand WHERE id = brand_id;

    SET affected_rows = ROW_COUNT();

    IF affected_rows = 0 THEN
        SET result = "Not found";
        SELECT "Entry not found" INTO msg;
    ELSE
        SET result = "Deleted";
        SELECT CONCAT("Successfully deleted brand with ID: ", brand_id) INTO msg;
    END IF;

    SELECT result AS Result, brand_id AS "Entry ID", msg AS Message;

END//

DELIMITER ;

CALL DeleteBrand(10, @deleted);

SELECT @deleted AS `Deleted Id`;

DROP PROCEDURE DeleteBrand;

