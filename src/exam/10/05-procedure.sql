/* Создать хранимую процедуру для поиска данных о водителях, имеющих оклад более введенного значения. Введенное значение оклада является параметром хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetDriverBySalary (IN driver_salary DECIMAL(10, 2))
BEGIN

    SELECT * FROM driver WHERE salary > driver_salary;

END//

DELIMITER ;

CALL GetDriverBySalary(50000);
