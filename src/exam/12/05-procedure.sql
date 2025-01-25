/* Создать хранимую процедуру для поиска данных о путевке. Код страны, код клиента, код отеля вводится как параметры хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetTour (IN country_code INT UNSIGNED, IN client_code INT UNSIGNED, IN hotel_code INT UNSIGNED)
BEGIN

    SELECT * FROM tour
        WHERE country_id = country_code AND client_id = client_code AND hotel_id = hotel_code;

END//

DELIMITER ;

CALL GetTour(1, 1, 1);
