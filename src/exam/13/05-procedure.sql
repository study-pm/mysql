/* Создать хранимую процедуру для поиска данных о сотруднике. Код должности вводить как параметр хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetAssigneeByPosition (IN position_code INT UNSIGNED)
BEGIN

    SELECT * FROM assignee WHERE position_id = position_code;

END//

DELIMITER ;

CALL GetAssigneeByPosition (3);
