/* Создать запросы */

-- а) Вывести список авторов, у которых количество изданных книг превышает 2. Отсортировать по ФИО авторов по возрастанию.
SELECT DISTINCT
    full_name AS ФИО,
    COUNT(*) AS "Книг издано"
    FROM author a JOIN book b ON a.id = b.author_id
    WHERE (SELECT COUNT(*) FROM book WHERE book.author_id = a.id) > 2
    GROUP BY author_id
    ORDER BY full_name
;

SELECT
    COUNT(*) AS Книг,
    full_name AS ФИО
    FROM author a JOIN book b ON a.id = b.author_id
    GROUP BY author_id
    HAVING Книг > 2
    ORDER BY full_name
;

-- б) Вывести список книг с иллюстрациями, изданных ранее 2012 г., в издательстве «Сова», с количеством страниц более 100 в том случае, если имеются книги с ценой менее 200 руб.
-- Отсортировать по году издания.
SELECT
    b.title AS Название,
    a.full_name AS Автор,
    p.title AS Издательство,
    page_count AS Страниц
    FROM book b
        JOIN publisher p ON b.publisher_id = p.id
        JOIN author a ON b.author_id = a.id
    WHERE is_illustrated = TRUE
        AND publishing_year < 2012
        AND p.title = 'Сова'
        AND page_count > 100
        AND EXISTS(SELECT 1 FROM book WHERE price < 200)
;

-- в) Удалить книги, в которых цена превышает среднюю цену по всем книгам.
DELETE FROM book WHERE price > (SELECT AVG(price) FROM book);

-- This will get the following error: ERROR 1093 (HY000): You can't specify target table 'book' for update in FROM clause

/*  Ошибка ERROR 1093 (HY000): You can't specify target table for update in FROM clause возникает, потому что MySQL не позволяет обновлять таблицу,
    которая одновременно используется в подзапросе.
    Чтобы обойти это ограничение, можно использовать временные таблицы или вложенные подзапросы.
*/

-- Решение с использованием временной таблицы
CREATE TEMPORARY TABLE temp_avg_price AS 
    SELECT AVG(price) AS avg_price
    FROM book;

DELETE FROM book 
    WHERE price > (SELECT avg_price FROM temp_avg_price);

-- Решение с использованием вложенного подзапроса
DELETE FROM book 
WHERE price > (
    SELECT avg_price 
    FROM (SELECT AVG(price) AS avg_price FROM book) AS subquery
);

SELECT * FROM book WHERE price > (SELECT AVG(price) FROM book);

SELECT * FROM book;

-- г) Изменить мощность судов с годом выпуска ранее 2005 на 15%.
