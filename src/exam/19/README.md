## 19. Вариант 19. Поездки машин

1. Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Поездки машин».
   
   Атрибуты для хранения в базе данных: гос. номер, марка, год выпуска, ФИО водителя, категория водителя, стаж работы, дата выезда, дата возвращения, пункт назначения, начальный пробег, конечный пробег.

   [01-create-db-tables.sql](./01-create-db-tables.sql)

2. Заполнить таблицы данными.

   [02-inserts.sql](./02-inserts.sql)

3. Создать запросы
   - а) Вывести гос. номер машин марки Мерседес с годом выпуска 2015 и 2018 водители которых имеют стаж работы в пределах от 5 до 10 лет. Отсортировать по убыванию года выпуска.
   - б) Вывести ФИО водителей, дату выезда, дату и пункт назначения, а также пробег, который водитель сделал в поездке в том случае, если средний начальный пробег машин менее 100000 км.
   - в) Изменить начальный пробег, увеличив его на 1000 км у машин 2010 года выпуска.
   - г) Удалить водителей со стажем работы 3 года.

   [03-requests.sql](./03-requests.sql)

4. Создать пользователя и дать ему возможность осуществлять изменение данных в таблице Водитель.

   [04-create-user-grants.sql](./04-create-user-grants.sql)

5. Создать хранимую процедуру для поиска Автомашины. Код водителя и код марки, вводить как параметры хранимой процедуры.

   [05-procedure.sql](./05-procedure.sql)
