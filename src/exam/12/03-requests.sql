/* Создать запросы */

-- а) Вывести количество путевок в каждую страну с ценой не более 30000 руб., причем количество путевок не должно превышать двух. Отсортировать по странам и по цене.
SELECT
    c.title AS Страна,
    COUNT(*) AS Путевок,
    GROUP_CONCAT(price SEPARATOR ', ') Цены,
    ROUND(AVG(price), 2) AS `Средняя цена`
    FROM tour JOIN country c ON tour.country_id = c.id
    WHERE price <= 30000
    GROUP BY c.id
    HAVING Путевок <= 2
    ORDER BY Страна, `Средняя цена`
;

SELECT * FROM tour JOIN country c ON tour.country_id = c.id;

-- б) Вывести ФИО клиентов, страну путевки, название отеля дату начала и дату окончания, и цену путевки. Отсортировать по убыванию названия стран.
SELECT
    full_name AS ФИО,
    c.title AS Страна,
    h.title AS Отель,
    start_date AS "Дата начала",
    end_date AS "Дата окончания",
    price AS Цена
    FROM tour
        JOIN client ON tour.client_id = client.id
        JOIN country c ON tour.country_id = c.id
        JOIN hotel h ON tour.hotel_id = h.id
    ORDER BY c.title DESC
;

-- в) Увеличить стоимость путевок в Париж на 10%.
UPDATE tour
    SET price = price * 1.1
    WHERE country_id IN (
        SELECT id FROM country WHERE title = 'Франция'
    )
;

UPDATE tour
    SET price = price * 1.1
    WHERE EXISTS (
        SELECT 1 FROM country WHERE id = tour.id AND title = 'Франция'
    )
;

SELECT * FROM tour
    WHERE country_id IN (
        SELECT id FROM country WHERE title = 'Франция'
    )
;

SELECT * FROM tour
    WHERE EXISTS (
        SELECT 1 FROM country WHERE id = tour.id AND title = 'Франция'
    )
;

SELECT * FROM tour JOIN country ON tour.country_id = country.id
    WHERE country.title = 'Франция'
;

-- г) Удалить путевки в Лондон стоимостью более 50000 руб. и датой начала путевки 06.07.2018.
DELETE FROM tour
    WHERE price > 50000 AND start_date = '2018-07-06'
;

SELECT * FROM tour
    WHERE price > 50000 AND start_date = '2018-07-06'
;
