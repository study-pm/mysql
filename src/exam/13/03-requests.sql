/* Создать запросы */

-- а) Вывести общую трудоемкость поручений для каждого программиста за январь и, предусмотреть надбавку в размере 10% от оклада.
SELECT
    full_name AS ФИО,
    SUM(labor_intensity) AS "Общая трудоемкость",
    salary AS Оклад,
    salary * 0.1 AS Надбавка
    FROM assignment
        JOIN assignee a ON assignment.assignee_id = a.id
        JOIN office o ON a.position_id = o.id
    WHERE o.title = 'программист' AND MONTH(start_date) = 1 AND YEAR(start_date) = YEAR(CURDATE())
    GROUP BY full_name, salary
;

-- б) Вывести ФИО сотрудников, выполняющих задания с 04.05.2018 по 07.05.2018 в том случае, если были поручения, данные всем сотрудникам, выполненные на отлично.
SELECT DISTINCT full_name AS ФИО
    FROM assignment ass
        JOIN assignee a ON ass.assignee_id = a.id
    WHERE (
        start_date < '2018-05-04' AND end_date < '2018-05-07' OR
        start_date BETWEEN '2018-05-04' AND '2018-05-07' OR
        end_date BETWEEN '2018-05-04' AND '2018-05-07'
    ) AND EXISTS(
        SELECT 1 FROM assignment JOIN performance p ON assignment.performance_id = p.id WHERE p.title = 'отлично'
    )
;

SELECT DISTINCT full_name AS ФИО
    FROM assignment ass
        JOIN assignee a ON ass.assignee_id = a.id
    WHERE (start_date BETWEEN '2018-05-04' AND '2018-05-07' OR end_date BETWEEN '2018-05-04' AND '2018-05-07')
        AND EXISTS(
        SELECT 1 FROM assignment JOIN performance p ON assignment.performance_id = p.id WHERE p.title = 'отлично'
    )
;

-- в) Увеличить оклад на 2000 руб., тем сотрудникам, у которых трудоемкость превышает 200.
UPDATE assignee
    SET salary = salary + 2000
    WHERE EXISTS(SELECT 1 FROM assignment WHERE assignee_id = assignee.id AND labor_intensity > 200)
;

SELECT * FROM assignee a
    WHERE EXISTS(SELECT 1 FROM assignment WHERE assignee_id = a.id AND labor_intensity > 200)
;

SELECT * FROM assignee a
    WHERE a.id IN (SELECT assignee_id FROM assignment WHERE labor_intensity > 200)
;

-- г) Удалить поручения, если их никто не выполняет.
DELETE FROM assignment WHERE assignee_id IS NULL;
