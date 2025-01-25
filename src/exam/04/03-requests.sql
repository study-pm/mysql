/* Создать запросы */

-- а) Вывести ФИО и образование претендентов на должность повара. Отсортировать по ФИО.
SELECT
    full_name AS ФИО,
    e.title AS Образование,
    j.title AS Должность
    FROM candidate c
        JOIN job_position j ON c.position_id = j.id
        JOIN education e ON c.education_id = e.id
    WHERE j.title = "Повар"
    ORDER BY full_name
;

-- б) Вывести название фирмы и требуемый стаж работы в том случае, если фирме требуется претендент женщина с высшим образованием не старше 35 лет.
SELECT
    company_name AS "Название фирмы",
    experience AS "Требуемый стаж работы"
    FROM vacancy v
        JOIN company c ON v.company_id = c.id
    WHERE gender = 'f' AND education_id = 1 AND max_age <= 35
;

-- в) Удалить претендентов, у которых среднее образование.
DELETE FROM candidate WHERE education_id = 2;

-- г) Увеличить оклад для должности инженер-программист и системный администратор на 10%.
UPDATE vacancy
    SET salary = salary * 1.1
    WHERE position_id IN
        (SELECT id FROM job_position WHERE title IN ('инженер-программист', 'системный администратор'))
;

SELECT * FROM vacancy v JOIN job_position j ON v.position_id = j.id;
