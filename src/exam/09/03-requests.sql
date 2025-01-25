/* Создать запросы */

-- а) Вывести трех футболистов нападающих, у которых зарплата больше средней по всем футболистам. Отсортировать по убыванию ФИО футболистов.
SELECT
    full_name AS ФИО,
    pp.title AS Амплуа,
    salary AS Зарплата
    FROM player p JOIN player_position pp ON p.position_id = pp.id
    WHERE pp.title = 'нападающий' AND salary > (SELECT AVG(salary) FROM player)
    ORDER BY full_name DESC
    LIMIT 3
;

-- б) Вывести названия городов и названия команд, которые в них находятся в том случае, если средний возраст футболистов команды не более 27 лет.
-- Отсортировать по возрастанию по городам и по командам.
SELECT
    team.title AS Команда, 
    city.title AS Город,
    ROUND(AVG(TIMESTAMPDIFF(YEAR, birth_date, CURDATE()))) AS "Средний возраст игроков"
    FROM team
        JOIN city ON team.city_id = city.id
        JOIN player ON team.id = player.team_id
    GROUP BY team.id
    HAVING AVG(TIMESTAMPDIFF(YEAR, birth_date, CURDATE())) <= 27
    ORDER BY city.title, team.title
;

-- в) Удалить футболистов, которые не играли в 2018 году.
DELETE FROM player
    WHERE team_id NOT IN (SELECT team1_id FROM game WHERE YEAR(holding_date) = 2018)
        AND team_id NOT IN (SELECT team2_id FROM game WHERE YEAR(holding_date) = 2018)
;

SELECT * FROM player
    WHERE team_id NOT IN (SELECT team1_id FROM game WHERE YEAR(holding_date) = 2018)
        AND team_id NOT IN (SELECT team2_id FROM game WHERE YEAR(holding_date) = 2018)
;

-- г) Изменить зарплату нападающих на 15%.
UPDATE player SET salary = salary * 1.15
    WHERE position_id IN (SELECT id FROM player_position WHERE title = 'нападающий')
;

UPDATE player SET salary = salary * 1.15
    WHERE EXISTS(SELECT 1 FROM player_position WHERE id = player.position_id AND title = 'нападающий')
;

SELECT * FROM player
    WHERE position_id IN (SELECT id FROM player_position WHERE title = 'нападающий')
;

SELECT * FROM player
    WHERE EXISTS(SELECT 1 FROM player_position WHERE id = player.position_id AND title = 'нападающий')
;

SELECT * FROM player JOIN player_position ON player.position_id = player_position.id;
