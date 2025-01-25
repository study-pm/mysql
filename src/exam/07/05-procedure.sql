/* Создать хранимую процедуру для поиска данных о судах грузоподъемностью большей среднего значения и выпущенные до определенного года. Год выпуска является параметром хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetShipByYear(IN manufacture_year YEAR)
BEGIN

    SELECT * FROM ship
        WHERE YEAR(manufacture_date) < manufacture_year AND
            carrying_capacity > (SELECT AVG(carrying_capacity) FROM ship)
    ;

END//

DELIMITER ;

CALL GetShipByYear(2015);

DROP PROCEDURE GetShipByYear;

DELIMITER //

CREATE PROCEDURE ShowProjects ()
BEGIN
    SELECT * FROM project;
END//

DELIMITER ;

CALL ShowProjects();

OUT qty INT UNSIGNED

DELIMITER //
CREATE PROCEDURE DeleteProject(IN proj_id INT UNSIGNED, OUT delete_id INT UNSIGNED)
BEGIN

    DECLARE affected_rows INT DEFAULT 0;    
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT CONCAT("Error deleting the project with ID: ", proj_id) AS Error;
    END;

    DELETE FROM project WHERE id = proj_id;

    SET affected_rows = ROW_COUNT();

    IF affected_rows > 0 THEN
        SELECT CONCAT("Successfully deleted the project with ID: ", proj_id) AS Success;
        SET delete_id = proj_id;
    ELSE
        SELECT CONCAT("No project found with the given ID: ", proj_id) AS Warning;
    END IF;

END//

DELIMITER ;

CALL DeleteProject(4, @del);

SELECT @del;

DELIMITER //
CREATE PROCEDURE AddProject(IN title VARCHAR(63), OUT added_id INT UNSIGNED)
BEGIN
    INSERT INTO project VALUE(DEFAULT, title);
    SET added_id = LAST_INSERT_ID();
    SELECT * FROM project WHERE id = added_id;
END//

DELIMITER ;

CALL AddProject('P1', @created_id);

SELECT @created_id;

DROP PROCEDURE AddProject;