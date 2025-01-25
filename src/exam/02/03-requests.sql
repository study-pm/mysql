/* Создать запросы */

-- а) Вывести список рабочих, имеющих среднее и высшее образование со стажем работы 10 лет.
SELECT
    full_name AS ФИО,
    e.title AS Образование,
    start_date AS "Начало работы"
    FROM worker w JOIN education e ON w.education_id = e.id
    WHERE e.title IN ('среднее', 'высшее') AND TIMESTAMPDIFF(YEAR, start_date, CURDATE()) >= 10
;

SELECT ФИО, Образование, Стаж FROM 
    (SELECT
        full_name AS ФИО,
        e.title AS Образование,
        TIMESTAMPDIFF(YEAR, start_date, CURRENT_TIMESTAMP()) AS Стаж
        FROM worker w JOIN education e ON w.education_id = e.id
        WHERE e.title IN ('среднее', 'высшее')
    ) AS subquery
    WHERE Стаж >= 10
;

-- This gets wrong work experience
SELECT
    full_name AS ФИО,
    education AS Образование,
    YEAR(CURDATE()) - YEAR(start_date) AS Стаж 
    FROM worker
    WHERE education IN ('среднее', 'высшее')
;

-- This gets wrong job experience
SELECT
    full_name AS ФИО,
    education AS Образование,
    YEAR(CURRENT_TIMESTAMP) - YEAR(start_date) AS Стаж 
    FROM worker
    WHERE education IN ('среднее', 'высшее')
;

-- б) Вывести ФИО рабочих всех цехов и их образование в том случае, если количество рабочих 1-го цеха не менее 5 человек. Отсортировать по ФИО.
SELECT
    full_name AS ФИО,
    e.title AS Образование
    FROM worker w JOIN education e ON w.education_id = e.id
    WHERE (SELECT COUNT(*) FROM worker WHERE workshop_number = 1) >= 5
    ORDER BY full_name
;

-- в) Увеличить надбавку рабочим женского пола 1 и 2 цехов на 3%.
UPDATE worker
    SET bonus = bonus * 1.03
    WHERE gender = 'ж' AND workshop_number IN (1, 2)
;

-- г) Удалить рабочих пенсионного возраста (ж-55 лет; м-60 лет).
DELETE FROM worker
    WHERE   (gender = 'ж' AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 55) OR
            (gender = 'м' AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 60)
;

-- Using subquery
DELETE FROM worker
WHERE id IN (
    SELECT id FROM (
        SELECT id, 
               YEAR(CURDATE()) - YEAR(birth_date) AS age 
        FROM workers
    ) AS subquery
    WHERE (gender = 'ж' AND age >= 55) 
       OR (gender = 'м' AND age >= 60)
);

-- Using a Common Table Expression (CTE)
WITH AgeCalculation AS (
    SELECT id, 
           YEAR(CURDATE()) - YEAR(birth_date) AS age 
    FROM workers
)
DELETE FROM workers
WHERE id IN (
    SELECT id FROM AgeCalculation
    WHERE (gender = 'ж' AND age >= 55) 
       OR (gender = 'м' AND age >= 60)
);
