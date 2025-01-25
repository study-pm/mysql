/* Создать хранимую процедуру для поиска данных о претендентах, имеющих детей и определенную специальность по образованию. Специальность вводится как параметр. */

DELIMITER //

CREATE PROCEDURE FindCandidate(IN spec VARCHAR(127))
BEGIN

    SELECT * FROM candidate
        WHERE children_number > 0 AND specialty LIKE CONCAT('%', spec, '%')
    ;

END//

DELIMITER ;

CALL FindCandidate('администратор');

CALL FindCandidate('инженер');

CALL FindCandidate('повар');
