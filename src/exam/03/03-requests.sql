/* Создать запросы */

-- а) Вывести список туристов, моложе 30 лет, увлеченных водным и конным туризмом. Отсортировать по ФИО туристов.

-- Вывод ФИО
SELECT t.full_name
    FROM tourist t
    JOIN sport s ON t.sport_id = s.id
    WHERE TIMESTAMPDIFF(YEAR, t.birth_date, CURRENT_DATE) < 30
        AND (s.title = 'водный туризм' OR s.title = 'конный туризм')
ORDER BY t.full_name;

-- Вывод ФИО, возраст, вид спорта
SELECT 
    full_name AS ФИО,
    age AS Возраст,
    sport AS `Вид спорта`
    FROM (SELECT
        full_name,
        TIMESTAMPDIFF (YEAR, birth_date, CURRENT_TIMESTAMP) AS age,
        s.title AS sport
        FROM tourist t JOIN sport s ON t.sport_id = s.id
    ) AS subquery
    WHERE age < 30 AND sport IN ('водный', 'конный')
    ORDER BY full_name
;

-- б) Вывести количество женщин-туристов и мужчин-туристов в том случае, если они оплатили за декабрь.
SELECT
    CASE
        WHEN gender = 'f' THEN "женщин"
        WHEN gender = 'm' THEN "мужчин"
    END AS Пол,
    COUNT(*) AS Количество
    FROM tourist t JOIN payment p ON t.id = p.tourist_id
    WHERE MONTH(p.payment_month) = 12
    GROUP BY gender
;

-- в) Уменьшить оплату туристам, у которых категория сложности высшая на 1%.

-- Уменьшение ставки
UPDATE tourist
    SET rate = rate * 0.99
    WHERE category = 'высшая'
;

-- Уменьшение уже произведенных (фактических) платежей
UPDATE payment p
JOIN tourist t ON p.tourist_id = t.id
SET p.amount = p.amount * 0.99
WHERE t.category = 'высшая';

-- г) Удалить туристов, не оплативших за 3 месяца.
DELETE FROM tourist
    WHERE id NOT IN (
        SELECT tourist_id FROM payment
        WHERE MONTH(payment_month) BETWEEN MONTH(DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH)) AND MONTH(DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH))
        GROUP BY tourist_id
        HAVING COUNT(*) = 3
    )
;
