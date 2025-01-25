/* Создать запросы */

-- а) Показать общий вес блюд, которые изготавливает повар Петрова.
SELECT SUM(ingredient_weight) AS "Общий вес блюд Петровой"
    FROM dish d
        JOIN chef ON d.chef_id = chef.id
        JOIN contents c
        JOIN ingredient i ON c.ingredient_id = i.id
    WHERE full_name LIKE 'Петрова%'
;

-- б) Вывести названия блюд, количество ингредиентов в которых не превышает 4 в том случае, если средняя наценка за блюдо меньше 50 руб. Отсортировать по возрастанию названия блюд.
SELECT
    dish.title AS "Название блюда",
    COUNT(ingredient_id) AS `Количество ингредиентов`
    FROM contents c JOIN dish ON c.dish_id = dish.id
    WHERE price_markup < 50
    GROUP BY dish_id
    HAVING `Количество ингредиентов` <= 4 AND (SELECT AVG(price_markup) FROM dish) < 50
    ORDER BY title
;

SELECT d.title
FROM dish d
JOIN contents c ON d.id = c.dish_id
GROUP BY d.title
HAVING COUNT(c.ingredient_id) <= 4 AND AVG(d.price_markup) < 50
ORDER BY d.title ASC;

SELECT
    dish.title AS "Название блюда",
    COUNT(ingredient_id) AS `Количество ингредиентов`
    FROM contents c JOIN dish ON c.dish_id = dish.id
    WHERE (SELECT AVG(price_markup) FROM dish) < 50
    GROUP BY dish_id
    HAVING `Количество ингредиентов` <= 4
    ORDER BY title
;

SELECT
    dish.title AS "Название блюда",
    COUNT(ingredient_id) AS `Количество ингредиентов`
    FROM contents c JOIN dish ON c.dish_id = dish.id
    GROUP BY dish_id
    HAVING `Количество ингредиентов` <= 4 AND (SELECT AVG(price_markup) FROM dish) < 50
    ORDER BY title
;

-- в) Удалить блюда, у которых цена более 150 руб.
DELETE FROM dish WHERE price > 150;

SELECT * FROM dish;

-- г) Уменьшить наценку на блюда, в приготовлении которых участвуют повара, имеющие возраст менее 25 лет.
UPDATE dish
    SET price_markup = price_markup * 0.9
    WHERE chef_id IN (
        SELECT id FROM chef WHERE TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) < 25
    )
;

-- That will give an extra update
UPDATE dish
    SET price_markup = price_markup * 0.9
    WHERE EXISTS (
        SELECT 1 FROM chef
            WHERE chef_id = dish.chef_id AND TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) < 25
    )
;

SELECT * FROM chef
    WHERE TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) < 25
;

SELECT *
    FROM dish JOIN chef ON dish.chef_id = chef.id
    WHERE TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) < 25
;

SELECT *, TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP)
    FROM dish JOIN chef ON dish.chef_id = chef.id
;

SELECT *, TIMESTAMPDIFF(YEAR, birth_date, CURDATE())
    FROM dish JOIN chef ON dish.chef_id = chef.id
;

SELECT *, TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE())
    FROM dish JOIN chef ON dish.chef_id = chef.id
;

-- This would give the wrong age
SELECT *, YEAR(CURDATE()) - YEAR(birth_date)
    FROM dish JOIN chef ON dish.chef_id = chef.id
;
