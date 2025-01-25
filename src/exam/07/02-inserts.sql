/* Заполнить таблицы данными. */

-- Заполнение таблицы должностей
INSERT INTO boat_park.job_position (position) VALUES 
    ('Капитан'),
    ('Механик'),
    ('Матрос'),
    ('Электрик')
;

-- Заполнение таблицы проектов
INSERT INTO boat_park.ship_project (title) VALUES ('П1'), ('П2');

-- Заполнение таблицы судов
INSERT INTO ship (title, manufacture_date, power, carrying_capacity, consumption_per_km, consumption_per_h, price, project_id) VALUES 
    ('Судно А', '2008-05-20', 500.00, 1000.00, 50.00, 300.00, 2000000.00, 1),
    ('Судно Б', '2012-08-15', 450.00, 1200.00, 48.00, 290.00, 2500000.00, 1),
    ('Судно В', '2015-11-10', 600.00, 1200.00, 60.00, 350.00, 3000000.00, 2),
    ('Судно Г', '2005-10-22', 520.00, 1015.00, 52.00, 310.00, 1500000.00, 1),
    ('Судно Д', '2003-05-16', 650.00, 1500.00, 75.00, 400.00, 900000.00, 2)
;

-- Заполнение таблицы экипажа
INSERT INTO crew (full_name, birth_date, position_id, ship_id) VALUES 
    ('Иванов Иван Иваныч', '1975-03-15', 1, 1),
    ('Петров Петр Петрович', '1980-07-22', 2, 1),
    ('Сидоров Сидор Сидорович', '1990-11-25', 3, 1),
    ('Кузнецов Александр Александрович', '1985-09-30', 4, 2),
    ('Лебедев Владимир Викторович', '1985-02-14', 3, 3)
;

DELIMITER //

CREATE PROCEDURE AddCrewMember(IN full_name VARCHAR(127), IN birth_date DATE, IN position_id INT UNSIGNED, IN ship_id INT UNSIGNED, OUT added_id INT UNSIGNED)
BEGIN

    DECLARE res VARCHAR(127);
    DECLARE msg TEXT;
    DECLARE sql_state CHAR(5);
    DECLARE err_code INT UNSIGNED DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN

        GET DIAGNOSTICS CONDITION 1
            sql_state = RETURNED_SQLSTATE,
            err_code = MYSQL_ERRNO,
            msg = MESSAGE_TEXT;

        SET res = "Error";

    END;

    INSERT INTO crew VALUES(DEFAULT, DEFAULT, full_name, birth_date, position_id, ship_id);

    IF ROW_COUNT() > 0 THEN
        SET added_id = LAST_INSERT_ID();
        SET res = "Added";
        SET sql_state = 23000;
        SELECT CONCAT("Successfully added the entry '", full_name, "'") INTO msg;
    END IF;
    
    SELECT res AS Result, msg AS Message, added_id AS ID, sql_state AS State, err_code AS Code;

END//

DELIMITER ;

CALL AddCrewMember("Мирнов Константин Евгеньевич", "2025-05-22", 5, 5, @created_id);

SELECT @created_id AS "Created ID";

DROP PROCEDURE AddCrewMember;
