/* Создать хранимую процедуру для поиска данных о футболистах из определенного города. Город является параметром хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetPlayerByCity (IN player_city VARCHAR(63))
BEGIN

    SELECT * FROM player p
        JOIN team t ON p.team_id = t.id
        JOIN city c ON t.city_id = c.id
        WHERE c.title LIKE CONCAT('%', player_city, '%')
    ;

END//

DELIMITER ;

CALL GetPlayerByCity('Москва');

CALL GetPlayerByCity('Петер');
