## 1. Вариант 1. Шахматные турниры

1. Создать в СУБД MySQL или в приложении MySQLWorkBench базу данных «Шахматные турниры».

    Атрибуты для хранения в базе данных: ФИО шахматиста, возраст, пол, город проживания, название турниров, в которых принимал участие шахматист, звание шахматиста (чемпиона мира по шахматам, кмс, мастер спорта, 1 разряд, 2разряд, чемпион РФ), город проведения турнира, вознаграждение (руб.), год проведения турнира.

    [01-create-db-tbl.sql](./01-create-db-tbl.sql)
    
    ```mermaid
    erDiagram
        CAR ||--o{ NAMED-DRIVER : allows
        player {
            INT id PK "UNSIGNED, AUTO_INCREMENT"
            VARCHAR(255) full_name "NOT NULL"
            INT age "CHECK(age > 10 AND age < 120)"
            string[] parts
        }
        PERSON ||--o{ NAMED-DRIVER : is
        PERSON {
            string driversLicense PK "The license #"
            string(99) firstName "Only 99 characters are allowed"
            string lastName
            string phone UK
            int age
        }
        NAMED-DRIVER {
            string carRegistrationNumber PK, FK
            string driverLicence PK, FK
        }
        MANUFACTURER only one to zero or more CAR : makes
    ```

2. Заполнить таблицы данными.

    [02-inserts.sql](./02-inserts.sql)

3. Создать запросы
   - а) Вывести количество шахматистов, имеющих звание мастер спорта и получивших ознаграждение более 100000 руб, в турнирах, в которых он участвовал.
   - б) Вывести ФИО и возраст шахматистов, проживающих в Москве в том случае, если в Чемпионате мира 2018 года участвовали шахматисты в возрасте от 20 до 40 лет.
   - в) Увеличить вознаграждение шахматистам, которые его получили не позднее 2014 года на 1%.
   - г) Удалить шахматистов, возраст которых достиг 70 лет.

    [03-requests.sql](./03-requests.sql)

4. Создать пользователя и дать ему право только просматривать таблицу шахматистов.

    [04-create-user-grants.sql](./04-create-user-grants.sql)

5. Создать хранимую процедуру для добавления новых шахматистов. Звание шахматиста вводить через параметр процедуры.

    [05-procedure.sql](./05-procedure.sql)
