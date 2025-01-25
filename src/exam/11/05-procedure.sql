/* Создать хранимую процедуру для поиска данных о специальностях, имеющихся в учебных заведениях. Название специальности вводится как параметр хранимой процедуры. */

DELIMITER //

CREATE PROCEDURE GetSpecialtiesByName (IN specialty_name VARCHAR(255))
BEGIN

    SELECT DISTINCT
        s.title AS Специальность,
        i.title AS "Учебное заведение"
        FROM applicant a
        JOIN specialty s ON a.specialty_id = s.id
        JOIN institution i ON a.institution_id = i.id
        WHERE s.title LIKE CONCAT('%', specialty_name, '%')
    ;

END//

DELIMITER ;

CALL GetSpecialtiesByName('комп');
