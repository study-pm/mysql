/* Создать запросы */

-- а) Вывести количество поступивших в каждое учебное заведение на специальность Компьютерные сети и средний балл при поступлении в колледж этих абитуриентов. Отсортировать по среднему баллу.
SELECT 
    i.title AS "Учебное заведение",
    COUNT(*) AS Поступивших,
    ROUND(AVG(admission_score)) AS `Средний балл при поступлении`
    FROM applicant a
        JOIN institution i ON a.institution_id = i.id
        JOIN specialty s ON a.specialty_id = s.id
    WHERE s.title = 'Компьютерные сети'
    GROUP BY i.id
    ORDER BY `Средний балл при поступлении`
;

-- б) Вывести список абитуриентов из СПб, поступивших в «Петровский» колледж в том случае, если есть абитуриенты из Москвы и Волгограда. Отсортировать по ФИО абитуриентов.
SELECT 
    full_name AS ФИО,
    birth_date AS "Дата рождения",
    c.title AS Город
    FROM applicant a
        JOIN institution i ON a.institution_id = i.id
        JOIN city c ON a.city_id = c.id
    WHERE i.title = 'Петровский колледж'
    AND c.title = 'Санкт-Петербург'
    AND EXISTS (SELECT 1 FROM applicant JOIN city ON applicant.city_id = city.id WHERE city.title = 'Москва')
    AND EXISTS (SELECT 1 FROM applicant JOIN city ON applicant.city_id = city.id WHERE city.title = 'Волгоград')
    ORDER BY full_name
;

-- в) Увеличить средний балл при поступлении в колледж абитуриентам из СПб на 5.
UPDATE applicant
    SET admission_score = admission_score + 5
    WHERE EXISTS(
        SELECT 1 FROM city WHERE city.id = applicant.city_id AND city.title = 'Санкт-Петербург'
    )
;

SELECT * FROM applicant a
    WHERE EXISTS(
        SELECT 1 FROM city WHERE city.id = a.city_id AND city.title = "Санкт-Петербург"
    )
;

SELECT * FROM applicant a
    WHERE a.city_id IN (
        SELECT id FROM city WHERE city.title = "Санкт-Петербург"
    )
;

SELECT * FROM applicant a JOIN city c ON a.city_id = c.id;

-- г) Удалить абитуриентов поступившим на специальность «Сварщик», которым исполнилось 35 лет.
DELETE FROM applicant
    WHERE TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) >= 35
    AND EXISTS(SELECT 1 FROM specialty WHERE id = applicant.specialty_id AND title = 'Сварщик')
;

SELECT * FROM applicant
    WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 35
    AND EXISTS(SELECT 1 FROM specialty WHERE id = applicant.specialty_id AND title = 'Сварщик')
;

SELECT * FROM applicant
    WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 35
    AND specialty_id IN (SELECT id FROM specialty WHERE title = 'Сварщик')
;

SELECT *, 
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Age
    FROM applicant a JOIN specialty s ON a.specialty_id = s.id
    WHERE s.title = 'Сварщик'
;
