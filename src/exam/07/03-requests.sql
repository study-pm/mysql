/* Создать запросы */

-- а) Вывести список членов команды судна с определенным названием, у которых имеются работающие, возраст которых превышает 45 лет. Отсортировать по ФИО по возрастанию.
SELECT 
    full_name AS ФИО,
    s.title AS Судно,
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Возраст
    FROM crew JOIN ship s ON crew.ship_id = s.id
    WHERE s.title = 'судно а' AND EXISTS(
        SELECT 1 FROM crew WHERE crew.ship_id = s.id AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 45
        )
    ORDER BY full_name
;

-- б) Вывести список названий судов, выпущенных ранее 2010 года и их новую стоимость в отдельном столбце (новая стоимость составляет 20% от первоначальной стоимости судна) в том случае,
-- если количество судов проекта П1 более двух. Отсортировать по новой стоимости в порядке убывания.
SELECT
    ship.title AS Название,
    manufacture_date AS `Год выпуска`,
    price AS Стоимость,
    price * 0.2 AS "Новая стоимость"
    FROM ship 
    WHERE YEAR(manufacture_date) < 2010 AND (
        SELECT COUNT(*) FROM ship JOIN ship_project sp ON ship.project_id = sp.id WHERE sp.title = 'П1'
        ) > 2
;

-- в) Удалить судна, в которых количество членов команды менее 5 человек.
DELETE FROM ship
    WHERE EXISTS (
        SELECT 1 FROM crew
        GROUP BY ship_id HAVING COUNT(*) < 5
    )
;

DELETE FROM ship
    WHERE id IN (
        SELECT ship_id FROM crew
        GROUP BY ship_id HAVING COUNT(*) < 5
    )
;

SELECT * FROM ship
    WHERE id IN (
        SELECT ship_id FROM crew
        GROUP BY ship_id HAVING COUNT(*) < 5
    )
;

SELECT * FROM ship
    WHERE (SELECT COUNT(*) FROM crew WHERE ship_id = ship.id) < 5
;

SELECT COUNT(*) FROM crew GROUP BY ship_id;

-- г) Изменить мощность судов с годом выпуска ранее 2005 на 15%.
UPDATE ship
    SET power = power - power * 0.15
    WHERE YEAR(manufacture_date) < 2005
;

SELECT * FROM ship WHERE YEAR(manufacture_date) < 2005;
