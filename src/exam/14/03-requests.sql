/* Создать запросы */

-- а) Вывести общую трудоемкость в днях для каждого механика 4 разряда и предусмотреть им премию, размер которой составит 15% от оклада
SELECT
    SUM(labor_intensity) AS `Общая трудоемкость`,
    full_name AS ФИО,
    grade AS Разряд,
    salary AS Оклад,
    salary * 0.15 AS Премия
    FROM repair_order o JOIN mechanic m ON o.assignee_id = m.id
    WHERE m.grade = 4
    GROUP BY assignee_id
;

-- б) Вывести ФИО механиков, выполняющих заказ с 04.05.2018 по 07.05.2018 в том случае, если не было заказов у механиков 5 разряда.
SELECT * FROM repair_order JOIN mechanic ON repair_order.assignee_id = mechanic.id
    WHERE (end_date BETWEEN '2018-05-04' AND '2018-05-07' OR
         start_date BETWEEN '2018-05-04' AND '2018-05-07') AND
        NOT EXISTS (SELECT 1 FROM repair_order o JOIN mechanic m ON o.assignee_id = m.id WHERE m.grade = 5)
;

-- г) Увеличить оклад на 2000 руб., тем механикам, у которых трудоемкость превышает 200.
UPDATE mechanic
    SET salary = salary + 2000
    WHERE EXISTS(
        SELECT 1 FROM repair_order WHERE assignee_id = mechanic.id GROUP BY assignee_id HAVING SUM(labor_intensity) > 200
        )
;

SELECT * FROM mechanic
    WHERE id IN (
        SELECT assignee_id FROM repair_order GROUP BY assignee_id HAVING SUM(labor_intensity) > 200
    )
;

SELECT * FROM mechanic
    WHERE EXISTS(
        SELECT 1 FROM repair_order WHERE assignee_id = mechanic.id GROUP BY assignee_id HAVING SUM(labor_intensity) > 200
        )
;

-- д) Удалить заказы, если их никто не выполняет.
DELETE FROM repair_order WHERE assignee_id IS NULL;

SELECT * FROM repair_order WHERE assignee_id IS NULL;
