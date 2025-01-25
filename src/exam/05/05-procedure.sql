/* Создать хранимую процедуру для поиска данных двух блюд, цена которых будет равна введенному значению. Цена вводится как параметр. */

DELIMITER //

CREATE PROCEDURE FindDishes(IN dish_price DECIMAL(10, 2))

BEGIN

    SELECT * FROM dish WHERE price = dish_price LIMIT 2; 

END//

DELIMITER ;

CALL FindDishes(120.00);

DELETE FindDishes;

DELIMITER //

CREATE PROCEDURE AddIngredient(IN ingredient_title VARCHAR(63), OUT added_id INT UNSIGNED)
BEGIN

    INSERT INTO ingredient VALUES(DEFAULT, ingredient_title);

    IF ROW_COUNT() > 0 THEN
        SET added_id = LAST_INSERT_ID();
        SELECT CONCAT("Successfully added the entry '", ingredient_title, "' with ID ", added_id);
    ELSE 
        SELECT CONCAT("Not added the entry '", ingredient_title);
    END IF;

END//

DELIMITER ;

CALL AddIngredient('морковь', @created_id);

SELECT @created_id; -- NULL

CALL AddIngredient('петрушка', @created_id);

SELECT @created_id;

DELIMITER //

CREATE PROCEDURE GetIngredient(IN ingredient_title VARCHAR(63), OUT row_ct INT UNSIGNED)
BEGIN

    CREATE TEMPORARY TABLE res SELECT * FROM ingredient WHERE title LIKE CONCAT('%', ingredient_title, '%');
    SELECT * FROM res;
    SELECT COUNT(*) INTO row_ct FROM res;
    DROP TEMPORARY TABLE res;
    
END//

DELIMITER ;

CALL GetIngredient('морковка', @rows);

SELECT @rows; -- 0

CALL GetIngredient('морк', @rows);

SELECT @rows; -- 1

DROP PROCEDURE GetIngredient;

CREATE PROCEDURE GetChef ()

BEGIN

    SELECT 
        id AS Код,
        IF (LENGTH(full_name) > 10, CONCAT(SUBSTRING(full_name, 1, 10), '...'), full_name) AS ФИО,
        birth_date AS "Дата рождения",
        TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Возраст,
        CASE
            WHEN gender = 'f' THEN 'женский'
            WHEN gender = 'm' THEN 'мужской'
            ELSE ''
        END AS Пол
    FROM chef
    UNION ALL
    SELECT
        COUNT(*) AS Код,
        '' AS ФИО,
        '' AS "Дата рождения",
        ROUND(AVG(TIMESTAMPDIFF(YEAR, birth_date, CURDATE())), 0) AS Возраст,
        '' AS Пол FROM chef
    ;

END//

DELIMITER ;

CALL p1();
