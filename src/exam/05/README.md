## 5. Вариант 5. Состав блюд

1. Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных «Состав блюд».

    Атрибуты для хранения в базе данных: ФИО повара, дата рождения повара, пол, название блюда, вид блюда (супы, второе, закуски), наценка на блюдо, название ингредиента, количество ингредиента в блюде, цена блюда.

    [01-create-db-tables.sql](./01-create-db-tables.sql)

2. Заполнить таблицы данными.

    [02-inserts.sql](./02-inserts.sql)

3. Создать запросы
   - а) Показать общий вес блюд, которые изготавливает повар Петрова.
   - б) Вывести названия блюд, количество ингредиентов в которых не превышает 4 в том случае, если средняя наценка за блюдо меньше 50 руб. Отсортировать по возрастанию названия блюд.
   - в) Удалить блюда, у которых цена более 150 руб.
   - г) Уменьшить наценку на блюда, в приготовлении которых участвуют повара, имеющие возраст менее 25 лет.

    [03-requests.sql](./03-requests.sql)

4. Создать пользователя и дать ему возможность добавлять данные в таблицу Повар.

    [04-create-user-grants.sql](./04-create-user-grants.sql)

5. Создать хранимую процедуру для поиска данных двух блюд, цена которых будет равна введенному значению. Цена вводится как параметр.
