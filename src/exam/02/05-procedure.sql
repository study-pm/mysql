/* Создать хранимую процедуру для добавления нового сотрудника. Пол сотрудника вводится через параметр. */

DELIMITER //

CREATE PROCEDURE addWorker(IN sex ENUM('ж', 'м'), OUT created_id INT UNSIGNED)
BEGIN
    DECLARE res_msg VARCHAR(255);
    
    DECLARE exit handler FOR SQLEXCEPTION    
    BEGIN
        SELECT 'Error occurred while adding worker' AS message;
    END;   
    
    INSERT INTO worker(full_name, birth_date, gender, grade, start_date, workshop_number, bonus, education_id, specialty_id)
    VALUE ('Александрова Ольга Сергеевна', '1990-12-22', sex, 3, '2015-01-01', 2, 900.00, 1, 1);
    
    IF ROW_COUNT() > 0 THEN
        SELECT LAST_INSERT_ID() INTO created_id;
        SET res_msg = 'Сотрудник успешно добавлен';
    ELSE
        SET res_msg = 'Ошибка: Сотрудник не был добавлен.';
    END IF;

    SELECT res_msg;
END//

DELIMITER ;

CALL addWorker('ж', @added_id);

SELECT @added_id;

SELECT * FROM worker;

DROP PROCEDURE addWorker;