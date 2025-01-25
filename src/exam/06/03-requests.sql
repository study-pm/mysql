/* Создать запросы */

-- а) Вывести номера машин, их стоимость и измененную стоимость машины. Измененная стоимость будет составлять четверть от первоначальной стоимости. Отсортировать по убыванию стоимости машин.
SELECT
    license_number AS "Номер",
    price AS Стоимость,
    price * 0.25 AS `Измененная стоимость`
    FROM car
    ORDER BY price DESC
;

-- б) Вывести общий пробег машин красного цвета и датой изготовления не ранее 2014 г. в том случае, если первоначальная стоимость машины не превышает 450000 руб.
SELECT *
    FROM car JOIN color c ON car.color_id = c.id
    WHERE c.title = 'красный' AND
        YEAR(manufacture_date) >= 2014 AND
        price <= 450000
;

-- в) Удалить машины, марки BMV, у которых пробег больше 40000 км и год изготовления не позднее 2012 года.
DELETE FROM car
    WHERE mileage > 40000 AND EXISTS (
        SELECT 1 FROM model WHERE model.id = car.model_id AND title = 'BMW'
    )
;

DELETE FROM car
    WHERE mileage > 40000 AND model_id IN (
        SELECT id FROM model WHERE title = 'BMW'
    )
;

SELECT *
    FROM car
    WHERE mileage > 40000 AND EXISTS (
        SELECT 1 FROM model WHERE model.id = car.model_id AND title = 'BMW'
    )
;

SELECT *
    FROM car
    WHERE mileage > 40000 AND model_id IN (
        SELECT id FROM model WHERE title = 'BMW'
    )
;

-- г) Изменить цвет машин с пробегом менее 100000 км на синий.
UPDATE car
    SET color_id = (SELECT id FROM color WHERE title = 'синий')
    WHERE mileage < 100000
;

SELECT * FROM car JOIN color c ON car.color_id = c.id WHERE mileage < 100000;

SELECT id FROM color WHERE title = 'синий';
