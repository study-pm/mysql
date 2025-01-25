/* Создать запросы */

-- а) Вывести количество шахматистов, имеющих звание мастер спорта и получивших ознаграждение более 100000 руб, в турнирах, в которых он участвовал.
SELECT COUNT(*) AS "Шахматистов"
    FROM player p
        JOIN category c ON p.title_id = c.id
        JOIN participation pt ON p.id = pt.player_id
    WHERE c.title = 'мастер спорта' AND prize > 100000
    GROUP BY p.id
;

-- Проверка
SELECT * FROM player p
    JOIN category c ON p.title_id = c.id
    JOIN participation pt ON p.id = pt.player_id
;

-- б) Вывести ФИО и возраст шахматистов, проживающих в Москве в том случае, если в Чемпионате мира 2018 года участвовали шахматисты в возрасте от 20 до 40 лет.
SELECT full_name AS ФИО, age AS Возраст
    FROM player p
        JOIN city c ON p.city_id = c.id
    WHERE c.title = "Москва" AND EXISTS(
        SELECT 1 FROM participation p
            JOIN tournament t ON p.tournament_id = t.id
            JOIN player ON p.player_id = player.id
        WHERE t.title = 'Чемпионат мира' AND holding_year = '2018' AND player.age BETWEEN 20 AND 40 
    )
;

-- Подзапрос
SELECT *
    FROM participation p
        JOIN tournament t ON p.tournament_id = t.id
        JOIN player ON p.player_id = player.id
        JOIN city c ON player.city_id = c.id
    WHERE t.title = 'Чемпионат мира' AND holding_year = '2018' AND player.age BETWEEN 20 AND 40
;

-- Alternative
SELECT p.full_name, p.age
FROM player p
JOIN participation par ON p.id = par.player_id
JOIN tournament t ON par.tournament_id = t.id
WHERE p.city_id = (SELECT id FROM city WHERE title = 'Москва') AND t.title = 'Чемпионат мира' AND p.age BETWEEN 20 AND 40;


-- в) Увеличить вознаграждение шахматистам, которые его получили не позднее 2014 года на 1%.
UPDATE participation p
    SET prize = prize * 0.01
    WHERE EXISTS (
        SELECT 1 FROM tournament t
        WHERE t.id = p.tournament_id AND holding_year <= 2014
    )
;

-- Подзапрос
SELECT * FROM participation p
    JOIN tournament t ON p.tournament_id = t.id
    WHERE holding_year <= 2014
;

-- г) Удалить шахматистов, возраст которых достиг 70 лет.
DELETE FROM player WHERE AGE >= 70;
