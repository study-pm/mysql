/* Создать запросы */

-- а) Вывести список водителей пенсионного возраста (ж-55, м-60), перевозивших груз весом более 10 т.
SELECT 
    full_name AS ФИО,
    birth_date AS 'Дата рождения',
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Возраст,
    CASE WHEN gender = 'f' THEN 'ж'
         WHEN gender = 'm' THEN 'м'
    END AS Пол
    FROM driver d
    WHERE (gender = 'f' AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 55 OR gender = 'm' AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 60) AND
    EXISTS(SELECT 1 FROM transportation WHERE driver_id = d.id AND cargo_weight > 10000)
;

SELECT 
    full_name AS ФИО,
    birth_date AS 'Дата рождения',
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Возраст,
    CASE WHEN gender = 'f' THEN 'ж'
         WHEN gender = 'm' THEN 'м'
    END AS Пол
    FROM driver d
    WHERE (gender = 'f' AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 55 OR gender = 'm' AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 60) AND
    EXISTS(SELECT 1 FROM transportation WHERE driver_id = d.id AND cargo_weight > 10000)
;

SELECT 
    full_name AS ФИО,
    birth_date AS 'Дата рождения',
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Возраст,
    CASE WHEN gender = 'f' THEN 'ж'
         WHEN gender = 'm' THEN 'м'
    END AS Пол
    FROM driver d
    WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >=
        CASE WHEN gender = 'f' THEN 55
             WHEN gender = 'm' THEN 60
        END
        AND EXISTS(SELECT 1 FROM transportation WHERE driver_id = d.id AND cargo_weight > 10000)
;

-- б) Вывести список городов, куда доставляются грузы весом более 10 т и стоимостью менее 100000 руб. в том случае, если на 10.12.2018 были перевозки.
SELECT DISTINCT c.title AS Город
    FROM transportation t JOIN city c ON t.delivery_city = c.id
    WHERE cargo_weight > 10000 AND cargo_cost < 100000 AND
    EXISTS(SELECT 1 FROM transportation WHERE transport_date = '2018-12-10')
;

-- в) Увеличить зарплату водителей со стажем более 10 лет на 15%.
UPDATE driver
    SET salary = salary * 1.15
    WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 10
;

SELECT *,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS Стаж
    FROM driver
    WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 10
;

-- г) Удалить водителей, имеющих оклад менее 20000 руб.
DELETE FROM driver WHERE salary < 20000;

SELECT * FROM driver WHERE salary < 20000;
