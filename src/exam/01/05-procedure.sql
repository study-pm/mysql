/* Создать хранимую процедуру для добавления новых шахматистов. Звание шахматиста вводить через параметр процедуры. */

DELIMITER //

CREATE PROCEDURE AddPlayer(IN player_title INT UNSIGNED, OUT added_id INT UNSIGNED)
BEGIN
    DECLARE affected_rows INT UNSIGNED DEFAULT 0;
    
    INSERT INTO player (full_name, age, gender, city_id, title_id) VALUES
        ('Каспаров Гарри Кимович', 61, 'm', 5, player_title)
    ;

    SET affected_rows = ROW_COUNT();
    SET added_id = LAST_INSERT_ID();

    IF affected_rows > 0 THEN
        SELECT CONCAT("Successfully added a new player with ID ", added_id) AS Result;
    ELSE 
        SELECT CONCAT("Error adding a new player with title '", player_title, "'") AS Result;
    END IF;

END//

DELIMITER ;

CALL AddPlayer(1, @created_id);

SELECT @created_id AS "Created ID";

DELETE AddPlayer;

DROP PROCEDURE AddPlayer;
