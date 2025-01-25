/* Создать хранимую процедуру для поиска Автомашины. Код водителя и код марки, вводить как параметры хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetCar(IN driver INT UNSIGNED, IN brand INT UNSIGNED)
BEGIN
    
    SELECT * FROM car WHERE driver_id = driver AND brand_id = brand;

END//

DELIMITER ;

CALL GetCar(2, 2, @found);

DROP PROCEDURE GetCar;
