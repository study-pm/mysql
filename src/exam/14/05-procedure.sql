/* Создать хранимую процедуру для поиска данных об автомашине. Код владельца вводить как параметр хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetCarByOwner(IN owner_code INT UNSIGNED)
BEGIN
    SELECT * FROM car WHERE owner_id = owner_code;
END//

DELIMITER ;

CALL GetCarByOwner(1);
