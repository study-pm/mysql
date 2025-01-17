# Reference

- [Basic Commands](#basic-commands)
  - [Database](#database)
    - [Showing databases](#showing-databases)
      - [Show all dbs](#show-all-dbs)
      - [Show specific database](#show-specific-database)
      - [Show current database](#show-current-database)
    - [Creating db](#creating-db)
    - [Show database params](#show-database-params)
    - [Activating db](#activating-db)
    - [Deleting db](#deleting-db)
  - [Работа с таблицами](#работа-с-таблицами)
    - [Показать таблицы](#показать-таблицы)
    - [Создание таблицы](#создание-таблицы)
    - [Показать структуру](#показать-структуру)
    - [Переименование таблицы](#переименование-таблицы)
    - [Полное удаление данных (очистка таблицы)](#полное-удаление-данных-очистка-таблицы)
      - [`DELETE` vs. `TRUNCATE`](#delete-vs-truncate)
        - [`DELETE`](#delete)
        - [`TRUNCATE`](#truncate)
        - [Comparison](#comparison)
        - [Difference](#difference)
        - [FASTER](#faster)
        - [Where to USE](#where-to-use)
    - [Удаление таблицы](#удаление-таблицы)
  - [Работа с полями/столбцами](#работа-с-полямистолбцами)
    - [Показать столбцы (колонки)](#показать-столбцы-колонки)
    - [Добавление столбцов/полей](#добавление-столбцовполей)
    - [Изменение столбцов/полей](#изменение-столбцовполей)
      - [Изменение значения по умолчанию: `ALTER COLUMN`](#изменение-значения-по-умолчанию-alter-column)
      - [Изменение столбца с переименованием: `CHANGE COLUMN`](#изменение-столбца-с-переименованием-change-column)
      - [Изменение типа столбца без переименования: `MODIFY COLUMN`](#изменение-типа-столбца-без-переименования-modify-column)
    - [Удаление столбцов/полей](#удаление-столбцовполей)
  - [Работа с первичными ключами](#работа-с-первичными-ключами)
  - [Работа с внешними ключами](#работа-с-внешними-ключами)
  - [Работа с индексами](#работа-с-индексами)
    - [Отображение индексов](#отображение-индексов)
    - [Добавление индекса](#добавление-индекса)
    - [Удаление индекса](#удаление-индекса)
  - [Работа с данными](#работа-с-данными)
    - [Просмотр всех данных таблицы](#просмотр-всех-данных-таблицы)
- [Типы данных](#типы-данных)
  - [Символьные типы](#символьные-типы)
  - [Числовые типы](#числовые-типы)
  - [Типы для работы с датой и временем](#типы-для-работы-с-датой-и-временем)
  - [Составные типы](#составные-типы)
  - [Бинарные типы](#бинарные-типы)
- [Атрибуты столбцов и таблиц](#атрибуты-столбцов-и-таблиц)
  - [`PRIMARY KEY`](#primary-key)
  - [`AUTO_INCREMENT`](#auto_increment)
  - [`UNIQUE`](#unique)
  - [`NULL` и `NOT NULL`](#null-и-not-null)
  - [`DEFAULT`](#default)
  - [`CHECK`](#check)
  - [Оператор `CONSTRAINT`. Установка имени ограничений](#оператор-constraint-установка-имени-ограничений)
- [Внешние ключи `FOREIGN KEY`](#внешние-ключи-foreign-key)
  - [`ON DELETE` и `ON UPDATE`](#on-delete-и-on-update)
  - [Каскадное удаление](#каскадное-удаление)
  - [Установка `NULL`](#установка-null)
- [Изменение таблиц и столбцов](#изменение-таблиц-и-столбцов)
  - [Добавление нового столбца](#добавление-нового-столбца)
  - [Удаление столбца](#удаление-столбца)
  - [Изменение значения по умолчанию](#изменение-значения-по-умолчанию)
  - [Изменение типа столбца](#изменение-типа-столбца)
  - [Добавление и удаление внешнего ключа](#добавление-и-удаление-внешнего-ключа)
  - [Добавление и удаление первичного ключа](#добавление-и-удаление-первичного-ключа)
- [Основные операции с данными](#основные-операции-с-данными)
  - [Добавление данных. Команда `INSERT`](#добавление-данных-команда-insert)
    - [Множественное добавление](#множественное-добавление)
  - [Выборка данных. Команда `SELECT`](#выборка-данных-команда-select)
  - [Исключение дубликатов. Оператор `DISTINCT`](#исключение-дубликатов-оператор-distinct)
    - [Count Distinct](#count-distinct)
  - [Ограничение размера выборки. Оператор `LIMIT`](#ограничение-размера-выборки-оператор-limit)
  - [Фильтрация данных. Оператор `WHERE`](#фильтрация-данных-оператор-where)
    - [Text Fields vs. Numeric Fields](#text-fields-vs-numeric-fields)
    - [Operators in The `WHERE` Clause](#operators-in-the-where-clause)
  - [Упорядочивание (сортировка) данных. Оператор `ORDER BY`](#упорядочивание-сортировка-данных-оператор-order-by)
    - [`DESC`](#desc)
    - [Order Alphabetically](#order-alphabetically)
    - [`ORDER BY` Several Columns](#order-by-several-columns)
    - [Using Both `ASC` and `DESC`](#using-both-asc-and-desc)
- [Агрегатные функции / Aggregate Functions](#агрегатные-функции--aggregate-functions)
  - [`COUNT`](#count)
  - [`MIN()` and `MAX()` Functions](#min-and-max-functions)
  - [`SUM()`](#sum)
- [Procedure Handlers](#procedure-handlers)
  - [Handle successful operation](#handle-successful-operation)
  - [Handle duplicated entries, unexpected exceptions](#handle-duplicated-entries-unexpected-exceptions)
  - [Capture error messages](#capture-error-messages)
  - [Roll back](#roll-back)
  - [`NOT FOUND` handler and `DELETE`](#not-found-handler-and-delete)
    - [Alternative Approach](#alternative-approach)
- [Using `FOUND_ROWS()`](#using-found_rows)
- [Regular expressions (`REGEXP()`)](#regular-expressions-regexp)
  - [Using Backslash](#using-backslash)
    - [Example Breakdown](#example-breakdown)
    - [Summary of Why Double Backslashes Are Needed](#summary-of-why-double-backslashes-are-needed)
    - [Conclusion](#conclusion)
- [Run scripts](#run-scripts)

## Basic Commands

### Database

#### Showing databases

##### Show all dbs
```sql
SHOW DATABASES;
```

##### Show specific database
via `SHOW DATABASES`:
```sql
SHOW DATABASES LIKE '<database_name>';
```

via `INFORMATION_SCHEMA`:
```sql
SELECT SCHEMA_NAME
  FROM INFORMATION_SCHEMA.SCHEMATA
  WHERE SCHEMA_NAME = '<database_name>';
```


##### Show current database

https://dev.mysql.com/doc/refman/8.4/en/getting-information.html

To find out which database is currently selected, use the `DATABASE()` function:
```sql
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| menagerie  |
+------------+
```

If you have indexes on a table, `SHOW INDEX FROM tbl_name` produces information about them. See Section 15.7.7.23, “SHOW INDEX Statement”, for more about this statement.

Show procedures for a given database:
```sql
SHOW PROCEDURE STATUS
    WHERE Db = DATABASE() AND Type = 'PROCEDURE';
```

#### Creating db

```sql
CREATE DATABASE [IF NOT EXISTS] <db_name>;
```

#### Show database params
```sql
SHOW CREATE DATABASE <db_name>;
```

#### Activating db

```sql
USE <db_name>
```

Установка базы данных в качестве текущей с проверкой:
```sql
mysql> USE mysql
Database changed
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| mysql      |
+------------+
1 row in set (0.00 sec)
```

#### Deleting db

```sql
DROP DATABASE [IF EXISTS] <db_name>;
```

### Работа с таблицами

#### Показать таблицы

```sql
SHOW TABLES;
```

#### Создание таблицы

```sql
CREATE TABLE название_таблицы
(название_столбца1 тип_данных атрибуты_столбца1,
 название_столбца2 тип_данных атрибуты_столбца2,
 ................................................
 название_столбцаN тип_данных атрибуты_столбцаN,
 атрибуты_уровня_таблицы
)
```

#### Показать структуру

```sql
DESCRIBE <название_таблицы>;
```

OR:
```sql
SHOW COLUMNS FROM <table_name>;
SHOW COLUMNS IN <table_name>;
```

#### Переименование таблицы

```sql
RENAME TABLE <старое_название> TO <новое_название>, <name1> TO <name2>, ...;
```

Or:

```sql
ALTER TABLE <старое_название> RENAME <новое_название>;
```

#### Полное удаление данных (очистка таблицы)

```sql
TRUNCATE TABLE <название_таблицы>;
```

OR:

```sql
DELETE FROM <table_name>;
```

##### `DELETE` vs. `TRUNCATE`
[comparison of truncate vs delete in mysql/sqlserver](
https://stackoverflow.com/questions/20559893/comparison-of-truncate-vs-delete-in-mysql-sqlserver)

###### `DELETE`

- `DELETE` is a DML Command.
- `DELETE` statement is executed using a row lock, each row in the table is locked for deletion.
- We can specify filters in where clause
- It deletes specified data if where condition exists.
- Delete activates a trigger because the operation are logged individually.
- Slower than truncate because, it keeps logs.
- Rollback is possible.

###### `TRUNCATE`

- `TRUNCATE` is a DDL command.
- `TRUNCATE TABLE` always locks the table and page but not each row.
- Cannot use Where Condition.
- It Removes all the data.
- `TRUNCATE TABLE` cannot activate a trigger because the operation does not log individual row deletions.
- Faster in performance wise, because it doesn't keep any logs.
- Rollback is possible.

###### Comparison
- `DELETE` and `TRUNCATE` both can be rolled back when used with `TRANSACTION` (`TRUNCATE` can be rolled back in SQL Server, but not in MySQL).
- if there is a PK with auto increment, truncate will reset the counter (which is not the case while using `DELETE`).

###### Difference
The most important difference is `DELETE` operations are transaction-safe and logged, which means `DELETE` can be rolled back. `TRUNCATE` cannot be done inside a transaction and can’t be rolled back. Because `TRUNCATE` is not logged recovering a mistakenly TRUNCATEd table is a much bigger problem than recovering from a `DELETE`.

`DELETE` will fail if foreign key constraints are broken; `TRUNCATE` may not honor foreign key constraints (it does for InnoDB tables). `DELETE` will fire any `ON DELETE` triggers; `TRUNCATE` will not.

###### FASTER
Truncate operations drop and re-create the table, which is much faster than deleting rows one by one, particularly for large tables.

###### Where to USE
- truncate: when table set to empty, and need reset auto-incrementing keys to 1. It's faster than `DELETE` because it deletes all data. `DELETE` will scan the table to generate a count of rows that were affected.

- delete: need rows to delete based on an optional `WHERE` clause. need logs and apply foreign key constraints

#### Удаление таблицы

```sql
DROP TABLE <название_таблицы>;
```

### Работа с полями/столбцами

#### Показать столбцы (колонки)

```sql
SHOW COLUMNS FROM <название_таблицы>
```

```sql
SHOW COLUMNS IN <название_таблицы>
```

#### Добавление столбцов/полей

`ADD COLUMN` or simply `ADD`:

```sql
ALTER TABLE <table_name> 
    ADD <column1_properties> [FIRST | AFTER],
    ADD <column2_properties> [FIRST | AFTER],
    ...
    ;
```

```sql
ALTER TABLE ctrana ADD id_c INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
```

#### Изменение столбцов/полей
Базовый синтаксис:

```sql
ALTER TABLE <название_таблицы> 
    ADD <название_столбца тип_данных_столбца [атрибуты_столбца]>, 
    DROP COLUMN <название_столбца>,
    MODIFY COLUMN <название_столбца тип_данных_столбца [атрибуты_столбца]>,
    ALTER COLUMN <название_столбца> SET DEFAULT <значение_по_умолчанию>,
    ADD [CONSTRAINT] <определение_ограничения>,
    DROP [CONSTRAINT] <имя_ограничения>
;
```

##### Изменение значения по умолчанию: `ALTER COLUMN`
`ALTER` is used to set or remove the default value for a column. Example:
```sql
ALTER TABLE MyTable ALTER COLUMN foo SET DEFAULT 'bar';
ALTER TABLE MyTable ALTER COLUMN foo DROP DEFAULT;
```

##### Изменение столбца с переименованием: `CHANGE COLUMN`
`CHANGE` is used to rename a column, change its datatype, or move it within the schema. Example:
```sql
ALTER TABLE MyTable CHANGE COLUMN foo bar VARCHAR(32) NOT NULL FIRST;
ALTER TABLE MyTable CHANGE COLUMN foo bar VARCHAR(32) NOT NULL AFTER baz;
```

##### Изменение типа столбца без переименования: `MODIFY COLUMN`
Used to do everything CHANGE COLUMN can, but without renaming the column. Example:
```sql
ALTER TABLE MyTable MODIFY COLUMN foo VARCHAR(32) NOT NULL AFTER baz;
```

#### Удаление столбцов/полей

```sql
ALTER TABLE <table_name> DROP COLUMN <column1_name>, <column2_name>, ...;
```

### Работа с первичными ключами


### Работа с внешними ключами
https://dev.mysql.com/doc/refman/8.0/en/create-table-foreign-keys.html

```sql
ALTER TABLE <tbl_name>
    ADD [CONSTRAINT [<fk_name>]] FOREIGN KEY
    [<index_name>] (<col_name>, ...)
    REFERENCES <tbl_name> (<col_name>,...)
    [ON DELETE <reference_option>]
    [ON UPDATE <reference_option>]
```

При добавлении ограничений мы можем указать для них имя, используя оператор `CONSTRAINT`, после которого указывается имя ограничения. Затем по этому имени мы можем удалить ограничение:

```sql
ALTER TABLE <tbl_name> DROP FOREIGN KEY <fk_name>;
```

### Работа с индексами

#### Отображение индексов
```sql
SHOW INDEX FROM <имя_вашей_таблицы>;
```

```sql
SHOW INDEXES FROM <название_таблицы>
```

```sql
SHOW INDEXES IN <название_таблицы>
```

#### Добавление индекса
```sql
ALTER TABLE <название_таблицы> ADD [UNIQUE] INDEX [<название_индекса>] (<название_столбца> [ASC | DESC])
```

```sql
ALTER TABLE <название_таблицы> ADD [UNIQUE] KEY [<название_индекса>] (<название_столбца> [ASC | DESC])
```

```sql
CREATE [UNIQUE] INDEX <index_name> ON <table_name> (<column_name [ASC | DESC]>,... )
```

#### Удаление индекса
```sql
DROP INDEX <название_индекса> ON <название таблицы>
```

### Работа с данными

#### Просмотр всех данных таблицы

```sql
SELECT * FROM <table_name>
```

## Типы данных

### Символьные типы

- **`CHAR`**: представляет строку фиксированной длины.

    Длина хранимой строки указывается в скобках, например, `CHAR(10)` — строка из десяти символов. И если в таблицу в данный столбец сохраняется строка из 6 символов (то есть меньше установленной длины в 10 символов), то строка дополняется 4 пробелами и в итоге все равно будет занимать 10 символов

    Тип `CHAR` может хранить до 255 байт.

- **`VARCHAR`**: представляет строку переменной длины.

    Длина хранимой строки также указыватся в скобках, например, `VARCHAR(10)`. Однако в отличие от `CHAR` хранимая строка будет занимать именно столько места, сколько необходимо. Например, если определенная длина в 10 символов, но в столбец сохраняется строка в 6 символов, то хранимая строка так и будет занимать 6 символов плюс дополнительный байт, который хранит длину строки.

    Всего тип `VARCHAR` может хранить до 65535 байт.

Начиная с MySQL 5.6 типы `CHAR` и `VARCHAR` по умолчанию используют кодировку UTF-8, которая позволяет использовать до 3 байт для хранения символа в зависимости от языка (для многих европейских языков по 1 байту на символ, для ряда восточно-европейских и ближневосточных — 2 байта, а для китайского, японского, корейского — по 3 байта на символ).

Ряд дополнительных типов данных представляют текст неопределенной длины:

- **`TINYTEXT`**: представляет текст длиной до 255 байт.

- **`TEXT`**: представляет текст длиной до 65 КБ.

- **`MEDIUMTEXT`**: представляет текст длиной до 16 МБ

- **`LONGTEXT`**: представляет текст длиной до 4 ГБ

### Числовые типы

- **`TINYINT`**: представляет целые числа от -128 до 127, занимает 1 байт

- **`BOOL`**: фактически не представляет отдельный тип, а является лишь псевдонимом для типа `TINYINT(1)` и может хранить два значения 0 и 1. Однако данный тип может также в качестве значения принимать встроенные константы `TRUE` (представляет число 1) и `FALSE` (предоставляет число 0).

    Также имеет псевдоним `BOOLEAN`.

- **`TINYINT UNSIGNED`**: представляет целые числа от 0 до 255, занимает 1 байт

- **`SMALLINT`**: представляет целые числа от -32768 до 32767, занимает 2 байтa

- **`SMALLINT UNSIGNED`**: представляет целые числа от 0 до 65535, занимает 2 байтa

- **`MEDIUMINT`**: представляет целые числа от -8388608 до 8388607, занимает 3 байта

- **`MEDIUMINT UNSIGNED`**: представляет целые числа от 0 до 16777215, занимает 3 байта

- **`INT`**: представляет целые числа от -2147483648 до 2147483647, занимает 4 байта

- **`INT UNSIGNED`**: представляет целые числа от 0 до 4294967295, занимает 4 байта

- **`BIGINT`**: представляет целые числа от -9 223 372 036 854 775 808 до 9 223 372 036 854 775 807, занимает 8 байт

- **`BIGINT UNSIGNED`**: представляет целые числа от 0 до 18 446 744 073 709 551 615, занимает 8 байт

- **`DECIMAL`**: хранит числа с фиксированной точностью. Данный тип может принимать два параметра `precision` и `scale`: `DECIMAL(precision, scale)`.

    Параметр `precision` представляет максимальное количество цифр, которые может хранить число. Это значение должно находиться в диапазоне от 1 до 65.

    Параметр `scale` представляет максимальное количество цифр, которые может содержать число после запятой. Это значение должно находиться в диапазоне от 0 до значения параметра `precision`. По умолчанию оно равно 0.

    Например, в определении следующего столбца:

    ```sql
    salary DECIMAL(5,2)
    ```

    Число 5 — `precision`, а число 2 — `scale`, поэтому данный столбец может хранить значения из диапазона от -999.99 до 999.99.

    Размер данных в байтах для `DECIMAL` зависит от хранимого значения.

    Данный тип также имеет псевдонимы `NUMERIC`, `DEC`, `FIXED`.

- **`FLOAT`**: хранит дробные числа с плавающей точкой одинарной точности от -3.4028 * 1038 до 3.4028 * 1038, занимает 4 байта

    Может принимать форму `FLOAT(M,D)`, где `M` — общее количество цифр, а `D` — количество цифр после запятой

- **`DOUBLE`**: хранит дробные числа с плавающей точкой двойной точности от -1.7976 * 10308 до 1.7976 * 10308, занимает 8 байт. Также может принимать форму `DOUBLE(M,D)`, где `M` — общее количество цифр, а `D` — количество цифр после запятой.

Данный тип также имеет псевдонимы `REAL` и `DOUBLE PRECISION`, которые можно использовать вместо `DOUBLE`.

### Типы для работы с датой и временем

- **`DATE`**: хранит даты с 1 января 1000 года до 31 деабря 9999 года (c "1000-01-01" до "9999-12-31"). По умолчанию для хранения используется формат *yyyy-mm-dd*. Занимает 3 байта.

- **`TIME`**: хранит время от -838:59:59 до 838:59:59. По умолчанию для хранения времени применяется формат "hh:mm:ss". Занимает 3 байта.

- **`DATETIME`**: объединяет время и дату, диапазон дат и времени - с 1 января 1000 года по 31 декабря 9999 года (с "1000-01-01 00:00:00" до "9999-12-31 23:59:59"). Для хранения по умолчанию используется формат "yyyy-mm-dd hh:mm:ss". Занимает 8 байт

- **`TIMESTAMP`**: также хранит дату и время, но в другом диапазоне: от "1970-01-01 00:00:01" UTC до "2038-01-19 03:14:07" UTC. Занимает 4 байта

- **`YEAR`**: хранит год в виде 4 цифр. Диапазон доступных значений от 1901 до 2155. Занимает 1 байт.

Тип `Date` может принимать даты в различных форматах, однако непосредственно для хранения в самой бд даты приводятся к формату "yyyy-mm-dd". Некоторые из принимаемых форматов:

- `yyyy-mm-dd` — 2018-05-25

- `yyyy-m-dd` — 2018-5-25

- `yy-m-dd` — 18-05-25

В таком формате двузначные числа от 00 до 69 воспринимаются как даты в диапазоне 2000-2069. А числа от 70 до 99 как диапазон чисел 1970 - 1999.

- `yyyymmdd` — 20180525

- `yyyy.mm.dd` — 2018.05.25

Для времени тип `Time` использует 24-часовой формат. Он может принимать время в различных форматах:

- `hh:mi` — 3:21 (хранимое значение 03:21:00)

- `hh:mi:ss` — 19:21:34

- `hhmiss` — 192134

Примеры значений для типов `DATETIME` и `TIMESTAMP`:

- `2018-05-25` — 19:21:34
- `2018-05-25` (хранимое значение 2018-05-25 00:00:00)

### Составные типы

- **`ENUM`**: хранит одно значение из списка допустимых значений. Занимает 1-2 байта

- **`SET`**: может хранить несколько значений (до 64 значений) из некоторого списка допустимых значений. Занимает 1-8 байт.

### Бинарные типы

- **`TINYBLOB`**: хранит бинарные данные в виде строки длиной до 255 байт.

- **`BLOB`**: хранит бинарные данные в виде строки длиной до 65 КБ.

- **`MEDIUMBLOB`**: хранит бинарные данные в виде строки длиной до 16 МБ

- **`LONGBLOB`**: хранит бинарные данные в виде строки длиной до 4 ГБ

## Атрибуты столбцов и таблиц
https://metanit.com/sql/mysql/2.4.php

### `PRIMARY KEY`

Атрибут **`PRIMARY KEY`** задает первичный ключ таблицы.

```sql
USE productsdb;

CREATE TABLE Customers
(
    Id INT PRIMARY KEY,
    Age INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20)
);
```

Первичный ключ уникально идентифицирует строку в таблице. В качестве первичного ключа необязательно должны выступать столбцы с типом `int`, они могут представлять любой другой тип.

Установка первичного ключа на уровне таблицы:

```sql
USE productsdb;
CREATE TABLE Customers
(
    Id INT,
    Age INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    PRIMARY KEY(Id)
);
```

Первичный ключ может быть составным. Такой ключ использовать сразу несколько столбцов, чтобы уникально идентифицировать строку в таблице. Например:

```sql
CREATE TABLE OrderLines
(
    OrderId INT,
    ProductId INT,
    Quantity INT,
    Price MONEY,
    PRIMARY KEY(OrderId, ProductId)
)
```

Здесь поля `OrderId` и `ProductId` вместе выступают как составной первичный ключ. То есть в таблице `OrderLines` не может быть двух строк, где для обоих из этих полей одновременно были бы одни и те же значения.

### `AUTO_INCREMENT`
Атрибут **`AUTO_INCREMENT**` позволяет указать, что значение столбца будет автоматически увеличиваться при добавлении новой строки. Данный атрибут работает для столбцов, которые представляют целочисленный тип или числа с плавающей точкой.

```sql
CREATE TABLE Customers
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20)
);
```

В данном случае значение столбца `Id` каждой новой добавленной строки будет увеличиваться на единицу.

### `UNIQUE`
Атрибут **`UNIQUE`** указывает, что столбец может хранить только уникальные значения.

```sql
CREATE TABLE Customers
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Phone VARCHAR(13) UNIQUE
);
```

В данном случае столбец `Phone`, который представляет телефон клиента, может хранить только уникальные значения. И мы не сможем добавить в таблицу две строки, у которых значения для этого столбца будет совпадать.

Также мы можем определить этот атрибут на уровне таблицы:

```sql
CREATE TABLE Customers
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(30),
    Phone VARCHAR(20),
    UNIQUE(Email, Phone)
);
```

### `NULL` и `NOT NULL`
Чтобы указать, может ли столбец принимать значение `NULL`, при определении столбца ему можно задать атрибут **`NULL`** или **`NOT NULL`**. Если этот атрибут явным образом не будет использован, то по умолчанию столбец будет допускать значение `NULL`. Исключением является тот случай, когда столбец выступает в роли первичного ключа — в этом случае по умолчанию столбец имеет значение `NOT NULL`.

```sql
CREATE TABLE Customers
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NULL,
    Phone VARCHAR(20) NULL
);
```

В данном случае столбец `Age` по умолчанию будет иметь атрибут `NULL`.

### `DEFAULT`
Атрибут **`DEFAULT`** определяет значение по умолчанию для столбца. Если при добавлении данных для столбца не будет предусмотрено значение, то для него будет использоваться значение по умолчанию.

```sql
CREATE TABLE Customers
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT DEFAULT 18,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL UNIQUE
);
```

Здесь столбец `Age` в качестве значения по умолчанию имеет число 18.

### `CHECK`
Атрибут **`CHECK`** задает ограничение для диапазона значений, которые могут храниться в столбце. Для этого после `CHECK` указывается в скобках условие, которому должен соответствовать столбец или несколько столбцов. Например, возраст клиентов не может быть меньше 0 или больше 100:

```sql
CREATE TABLE Customers
(
    Id INT AUTO_INCREMENT,
    Age INT DEFAULT 18 CHECK(Age >0 AND Age < 100),
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) CHECK(Email !=''),
    Phone VARCHAR(20) CHECK(Phone !='')
);
```

Кроме проверки возраста здесь также проверяется, что столбцы `Email` и `Phone` не могут иметь пустую строку в качестве значения (пустая строка не эквивалентна значению `NULL`).

Для соединения условий используется ключевое слово `AND`. Условия можно задать в виде операций сравнения больше (`>`), меньше (`<`), не равно (`!=`).

Также `CHECK` можно использовать на уровне таблицы:

```sql
CREATE TABLE Customers
(
    Id INT AUTO_INCREMENT,
    Age INT DEFAULT 18,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Phone VARCHAR(20),
    CHECK((Age >0 AND Age<100) AND (Email !='') AND (Phone !=''))
);
```

### Оператор `CONSTRAINT`. Установка имени ограничений
С помощью ключевого слова **`CONSTRAINT`** можно задать имя для ограничений. Они указываются после ключевого слова `CONSTRAINT` перед атрибутами на уровне таблицы:

```sql
CREATE TABLE Customers
(
    Id INT AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    Phone VARCHAR(20) NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY(Id),
    CONSTRAINT customer_phone_uq UNIQUE(Phone),
    CONSTRAINT customer_age_chk CHECK(Age >0 AND Age<100)
);
```

В данном случае ограничение для `PRIMARY KEY` называется `customers_pk`, для `UNIQUE` — `customer_phone_uq`, а для `CHECK` — `customer_age_chk`. Смысл установки имен ограничений заключается в том, что впоследствии через эти имена мы сможем управлять ограничениями — удалять или изменять их.

Установить имя можно для ограничений `PRIMARY KEY`, `CHECK`, `UNIQUE`, а также `FOREIGN KEY`, который рассматриватся далее.

## Внешние ключи `FOREIGN KEY`

Внешние ключи позволяют установить связи между таблицами. Внешний ключ устанавливается для столбцов из зависимой, подчиненной таблицы, и указывает на один из столбцов из главной таблицы. Как правило, внешний ключ указывает на первичный ключ из связанной главной таблицы.

Общий синтаксис установки внешнего ключа на уровне таблицы:
```sql
[CONSTRAINT имя_ограничения]
FOREIGN KEY (столбец1, столбец2, ... столбецN)
REFERENCES главная_таблица (столбец_главной_таблицы1, столбец_главной_таблицы2, ... столбец_главной_таблицыN)
[ON DELETE действие]
[ON UPDATE действие]
```

Для создания ограничения внешнего ключа после **`FOREIGN KEY`** указывается столбец таблицы, который будет представляет внешний ключ. А после ключевого слова **`REFERENCES`** указывается имя связанной таблицы, а затем в скобках имя связанного столбца, на который будет указывать внешний ключ. После выражения **`REFERENCES`** идут выражения **`ON DELETE`** и **`ON UPDATE`**, которые задают действие при удалении и обновлении строки из главной таблицы соответственно.

Например, определим две таблицы и свяжем их посредством внешнего ключа:
```sql
CREATE TABLE Customers
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Phone VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Orders
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt Date,
    FOREIGN KEY (CustomerId)  REFERENCES Customers (Id)
);
```

В данном случае определены таблицы `Customers` и `Orders`. `Customers` является главной и представляет клиента. `Orders` является зависимой и представляет заказ, сделанный клиентом. Таблица `Orders` через столбец `CustomerId` связана с таблицей `Customers` и ее столбцом `Id`. То есть столбец `CustomerId` является внешним ключом, который указывает на столбец `Id` из таблицы `Customers`.

С помощью оператора **`CONSTRAINT`** можно задать имя для ограничения внешнего ключа:
```sql
CREATE TABLE Orders
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt Date,
    CONSTRAINT orders_custonmers_fk
    FOREIGN KEY (CustomerId)  REFERENCES Customers (Id)
);
```

### `ON DELETE` и `ON UPDATE`
С помощью выражений **`ON DELETE`** и **`ON UPDATE`** можно установить действия, которые выполняются соответственно при удалении и изменении связанной строки из главной таблицы. В качестве действия могут использоваться следующие опции:

- **`CASCADE`**: автоматически удаляет или изменяет строки из зависимой таблицы при удалении или изменении связанных строк в главной таблице.

- **`SET NULL`**: при удалении или обновлении связанной строки из главной таблицы устанавливает для столбца внешнего ключа значение **`NULL`**. (В этом случае столбец внешнего ключа должен поддерживать установку `NULL`)

- **`RESTRICT`**: отклоняет удаление или изменение строк в главной таблице при наличии связанных строк в зависимой таблице.

- **`NO ACTION`**: то же самое, что и `RESTRICT`.

- **`SET DEFAULT`**: при удалении связанной строки из главной таблицы устанавливает для столбца внешнего ключа значение по умолчанию, которое задается с помощью атрибуты `DEFAULT`. Несмотря на то, что данная опция в принципе доступна, однако движок InnoDB не поддерживает данное выражение.

### Каскадное удаление
Каскадное удаление позволяет при удалении строки из главной таблицы автоматически удалить все связанные строки из зависимой таблицы. Для этого применяется опция **`CASCADE`**:

```sql
CREATE TABLE Orders
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt Date,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE CASCADE
);
```
Подобным образом работает и выражение **`ON UPDATE CASCADE`**. При изменении значения первичного ключа автоматически изменится значение связанного с ним внешнего ключа. Однако поскольку первичные ключи изменяются очень редко, да и с принципе не рекомендуется использовать в качестве первичных ключей столбцы с изменяемыми значениями, то на практике выражение `ON UPDATE` используется редко.

### Установка `NULL`
При установки для внешнего ключа опции **`SET NULL`** необходимо, чтобы столбец внешнего ключа допускал значение `NULL`:
```sql
CREATE TABLE Orders
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt Date,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE SET NULL
);
```

## Изменение таблиц и столбцов
Если таблица уже была ранее создана, и ее необходимо изменить, то для этого применяется команда **`ALTER TABLE`**. Ее сокращенный формальный синтаксис:
```sql
ALTER TABLE название_таблицы
{ ADD название_столбца тип_данных_столбца [атрибуты_столбца] |
  DROP COLUMN название_столбца |
  MODIFY COLUMN название_столбца тип_данных_столбца [атрибуты_столбца] |
  ALTER COLUMN название_столбца SET DEFAULT значение_по_умолчанию |
  ADD [CONSTRAINT] определение_ограничения |
  DROP [CONSTRAINT] имя_ограничения}
```
Вообще данная команда поддерживает гораздо больше опций и возможностей. Все их можно посмотреть в документации. Рассмотрим лишь основные сценарии, с которыми мы можем столкнуться.

### Добавление нового столбца
Добавим в таблицу `Customers` новый столбец `Address`:
```sql
ALTER TABLE Customers
ADD Address VARCHAR(50) NULL;
```
В данном случае столбец `Address` имеет тип `VARCHAR` и для него определен атрибут `NULL`.

### Удаление столбца
Удалим столбец `Address` из таблицы `Customers`:
```sql
ALTER TABLE Customers
DROP COLUMN Address;
```

### Изменение значения по умолчанию
Установим в таблице `Customers` для столбца `Age` значение по умолчанию `22`:
```sql
ALTER TABLE Customers
ALTER COLUMN Age SET DEFAULT 22;
```

### Изменение типа столбца
Изменим в таблице `Customers` тип данных у столбца `FirstName` на `CHAR(100)` и установим для него атрибут `NULL`:
```sql
ALTER TABLE Customers
MODIFY COLUMN FirstName CHAR(100) NULL;
```

### Добавление и удаление внешнего ключа
Пусть изначально в базе данных будут добавлены две таблицы, никак не связанные:
```sql
CREATE TABLE Customers
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT, 
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL
);
CREATE TABLE Orders
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt Date
);
```

Добавим ограничение внешнего ключа к столбцу `CustomerId` таблицы `Orders`:
```sql
ALTER TABLE Orders
ADD FOREIGN KEY(CustomerId) REFERENCES Customers(Id);
```

При добавлении ограничений мы можем указать для них имя, используя оператор `CONSTRAINT`, после которого указывается имя ограничения:
```sql
ALTER TABLE Orders
ADD CONSTRAINT orders_customers_fk 
FOREIGN KEY(CustomerId) REFERENCES Customers(Id);
```

В данном случае ограничение внешнего ключа называется `orders_customers_fk`. Затем по этому имени мы можем удалить ограничение:
```sql
ALTER TABLE Orders
DROP FOREIGN KEY orders_customers_fk;
```
### Добавление и удаление первичного ключа
Добавим в таблицу Products первичный ключ:
```sql
CREATE TABLE Products
(
    Id INT,
    Model VARCHAR(20)
);
 
ALTER TABLE Products
ADD PRIMARY KEY (Id);
```

Теперь удалим первичный ключ:
```sql
ALTER TABLE Products
DROP PRIMARY KEY;
```

## Основные операции с данными

### Добавление данных. Команда `INSERT`
Для добавления данных в БД в MySQL используется команда **`INSERT`**, которая имеет следующий формальный синтаксис:
```sql
INSERT [INTO] имя_таблицы [(список_столбцов)] VALUES (значение1, значение2, ... значениеN)
```

После выражения **`INSERT INTO`** в скобках можно указать список столбцов через запятую, в которые надо добавлять данные, и в конце после слова **VALUES** скобках перечисляют добавляемые для столбцов значения.

Например, пусть в базе данных productsdb есть следующая таблица Products:
```sql
CREATE DATABASE productsdb;
USE productsdb;
CREATE TABLE Products
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price DECIMAL NOT NULL
);
```

Добавим в эту таблицу одну строку с помощью следующего кода:
```sql
INSERT Products(ProductName, Manufacturer, ProductCount, Price) 
VALUES ('iPhone X', 'Apple', 5, 76000);
```
В данном случае значения будут передаваться столбцам по позиции. То есть стобцу ProductName передается строка "iPhone X", столбцу Manufacturer — строка "Apple" и так далее.

Важно, чтобы между значениями и типами данных столбцов было соответствие. Так, столбец ProductName представляет тип `varchar`, то есть строку. Соответственно этому столбцу мы можем передать строковое значение в одинарных кавычках. А стобец ProductCount представляет тип `int`, то есть целое число, поэтому данному столбцу нужно передать целые числа, но никак не строки.

После удачного выполнения в MySQL Workbench в поле вывода должны появиться зеленый маркер и сообщение "1 row(s) affected".

Необязательно при добавлении данных указывать значения абсолютно для всех столбцов таблицы. Например, в примере выше не указано значение для стобца Id. Но поскольку для данного столбца определен атрибут `AUTO_INCREMENT`, то его значение будет автоматически генерироваться.

Также мы можем опускать при добавлении такие столбцы, которые поддерживают значение `NULL` или для которых указано значение по умолчанию, то есть для них определены атрибуты `NULL` или `DEFAULT`. Так, в таблице Products столбец ProductCount имеет значение по умолчанию — число 0. Поэтому мы можем при добавлении опустить этот столбец, и ему будет передаваться число 0:
```sql
INSERT Products(ProductName, Manufacturer, Price) 
VALUES ('Galaxy S9', 'Samsung', 63000);
```

С помощью ключевых слов `DEFAULT` и `NULL` можно указать, что в качестве значения будет использовать значение по умолчанию или `NULL` соответственно:

```sql
INSERT Products(ProductName, Manufacturer, Price, ProductCount) 
VALUES ('Nokia 9', 'HDM Global', 41000, DEFAULT);
```

или
```sql
INSERT Products(ProductName, Manufacturer, Price, ProductCount) 
VALUES ('Nokia 9', 'HDM Global', 41000, NULL);
```

#### Множественное добавление
Также мы можем добавить сразу несколько строк:
```sql
INSERT Products(ProductName, Manufacturer, Price, ProductCount) 
VALUES
('iPhone 8', 'Apple', 51000, 3),
('P20 Lite', 'Huawei', 34000, 4),
('Galaxy S8', 'Samsung', 46000, 2);
```

В данном случае в таблицу будут добавлены три строки.

### Выборка данных. Команда `SELECT`
Для выборки данных из БД в MySQL применяется команда **`SELECT`**. В упрощенном виде она имеет следующий синтаксис:
```sql
SELECT [DISTINCT] column_name(s)
FROM table_name
WHERE condition
ORDER BY column1, column2, ... [ASC|DESC];
HAVING condition
LIMIT number;
```

Например, пусть ранее была создана таблица `Products`, и в нее добавлены некоторые начальные данные:
```sql
CREATE TABLE Products
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price DECIMAL
);
  
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);
CREATE TABLE Products
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price DECIMAL
);
  
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);
```

Получим все объекты из этой таблицы:
```sql
SELECT * FROM Products;
```

Символ звездочка * указывает, что нам надо получить все столбцы.

Стоит отметить, что применение звездочки * для получения данных считается не очень хорошей практикой, так как обычно необходимо получить данные по небольшому набору столбцов. Поэтому более оптимальный подход заключается в указании всех необходимых столбцов после слова `SELECT`. Исключение составляет тот случай, когда надо получить данные по абсолютно всем столбцам таблицы. Также использование символа * может быть предпочтительно тогда, когда названия столбцов не известны.

Если необходимо получить данные не из всех, а из каких-то конкретных столбцов, тогда спецификации этих столбцов перечисляются через запятую после `SELECT`:
```sql
SELECT ProductName, Price FROM Products;
```

Спецификация столбца необязательно должна представлять его название. Это может быть любое выражение, например, результат арифметической операции. Так, выполним следующий запрос:
```sql
SELECT ProductName, Price * ProductCount
FROM Products;
```

Здесь при выборке будут создаваться два столбца. Причем второй столбец представляет значение столбца Price, умноженное на значение столбца ProductCount, то есть совокупную стоимость товара.

С помощью оператора **`AS`** можно изменить название выходного столбца или определить его псевдоним:
```sql
SELECT ProductName AS Title, Price * ProductCount AS TotalSum
FROM Products;
```

Здесь для первого столбца определяется псевдоним Title, хотя в реальности он будет представлять столбец ProductName. Второй столбец TotalSum хранит произведение столбцов ProductCount и Price.

### Исключение дубликатов. Оператор `DISTINCT`
The `SELECT DISTINCT` statement is used to return only distinct (different) values.

```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

!!! example Example

*Select all the different countries from the "Customers" table:*
```sql
SELECT DISTINCT Country FROM Customers;
```

#### Count Distinct
By using the `DISTINCT` keyword in a function called `COUNT`, we can return the number of different countries.

!!! example Example
```sql
SELECT COUNT(DISTINCT Country) FROM Customers;
```

### Ограничение размера выборки. Оператор `LIMIT`
Для ограничения

### Фильтрация данных. Оператор `WHERE`
Зачастую необходимо извлекать не все данные из БД, а только те, которые соответствуют определенному условию. Для фильтрации данных в команде `SELECT` применяется оператор `WHERE`, после которого указывается условие:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

#### Text Fields vs. Numeric Fields
SQL requires single quotes around text values (most database systems will also allow double quotes).

#### Operators in The `WHERE` Clause
Если условие истинно, то строка попадает в результирующую выборку. В качестве можно использовать операции сравнения, которые сравнивают два выражения:

- **`=`**: сравнение на равенство

- **`!=`**: сравнение на неравенство

- **`<>`**: сравнение на неравенство

- **`<`**: меньше чем

- **`>`**: больше чем

- **`<=`**: меньше чем или равно

- **`>=`**: больше чем или равно

К примеру, выберем всех товары, производителем которых является компания Samsung:

### Упорядочивание (сортировка) данных. Оператор `ORDER BY`
The `ORDER BY` keyword is used to sort the result-set in ascending or descending order.

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... [ASC|DESC];
```

#### `DESC`
The `ORDER BY` keyword sorts the records in ascending order by default. To sort the records in descending order, use the `DESC` keyword.

!!! example Example

*Sort the products from highest to lowest price:*
```sql
SELECT * FROM Products
ORDER BY Price DESC;
```

#### Order Alphabetically
For string values the `ORDER BY` keyword will order alphabetically:

!!! example Example

*Sort the products alphabetically by `ProductName`:*
```sql
SELECT * FROM Products
ORDER BY ProductName;
```

To sort the table reverse alphabetically, use the `DESC` keyword:

!!! example Example

*Sort the products by `ProductName` in reverse order:*
```sql
SELECT * FROM Products
ORDER BY ProductName DESC;
```

#### `ORDER BY` Several Columns
The following SQL statement selects all customers from the "Customers" table, sorted by the "Country" and the "CustomerName" column. This means that it orders by `Country`, but if some rows have the same `Country`, it orders them by `CustomerName`:

!!! example Example

```sql
SELECT * FROM Customers
ORDER BY Country, CustomerName;
```

#### Using Both `ASC` and `DESC`
The following SQL statement selects all customers from the "Customers" table, sorted ascending by the "Country" and descending by the "CustomerName" column:

!!! example Example

```sql
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;
```

## Агрегатные функции / Aggregate Functions
An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

Aggregate functions are often used with the `GROUP BY` clause of the `SELECT` statement. The `GROUP BY` clause splits the result-set into groups of values and the aggregate function can be used to return a single value for each group.

The most commonly used SQL aggregate functions are:

- `MIN()` — returns the smallest value within the selected column
- `MAX()` — returns the largest value within the selected column
- `COUNT()` — returns the number of rows in a set
- `SUM()` — returns the total sum of a numerical column
- `AVG()` — returns the average value of a numerical column

> Aggregate functions ignore null values (except for `COUNT()`).

### `COUNT`
The `COUNT()` function returns the number of rows that matches a specified criterion.

```sql
SELECT COUNT(column_name) [AS alias]
FROM table_name
WHERE condition;
```

!!! example Example

*Find the total number of rows in the `Products` table:*
```sql
SELECT COUNT(*)
FROM Products;
```

You can specify a column name instead of the asterix symbol `(*)`.

If you specify a column name instead of `(*)`, NULL values will not be counted.

!!! example Example

*Find the number of products where the `ProductName` is not null:*
```sql
SELECT COUNT(ProductName)
FROM Products;
```

You can add a `WHERE` clause to specify conditions:

!!! example Example

*Find the number of products where `Price` is higher than 20:*
```sql
SELECT COUNT(ProductID)
FROM Products
WHERE Price > 20;
```

You can ignore duplicates by using the `DISTINCT` keyword in the `COUNT()` function.

If `DISTINCT` is specified, rows with the same value for the specified column will be counted as one.

!!! example Example

*How many **different** prices are there in the `Products` table:*
```sql
SELECT COUNT(DISTINCT Price)
FROM Products;
```

Give the counted column a name by using the `AS` keyword.

!!! example Example

*Name the column "Number of records":*
```sql
SELECT COUNT(*) AS [Number of records]
FROM Products;
```

Here we use the `COUNT()` function and the `GROUP BY` clause, to return the number of records for each category in the Products table:

!!! example Example

```sql
SELECT COUNT(*) AS [Number of records], CategoryID
FROM Products
GROUP BY CategoryID;
```

### `MIN()` and `MAX()` Functions
The `MIN()` function returns the smallest value of the selected column.

```sql
SELECT MIN(column_name) [AS alias]
FROM table_name
WHERE condition;
```

The `MAX()` function returns the largest value of the selected column.

```sql
SELECT MAX(column_name) [AS alias]
FROM table_name
WHERE condition;
```
!!! example Example

*Use the `MIN()` function with alias*

```sql
SELECT MIN(Price) AS SmallestPrice
FROM Products;
```

!!! example Example

*Use the `MIN()` function and the `GROUP BY` clause:*

```sql
SELECT MIN(Price) AS SmallestPrice, CategoryID
FROM Products
GROUP BY CategoryID;
```

### `SUM()`
The `SUM()` function returns the total sum of a numeric column.

```sql
SELECT SUM(column_name) [AS alias]
FROM table_name
WHERE condition;
```

You can add a `WHERE` clause to specify conditions:

!!! example Example

*Return the sum of the `Quantity` field for the product with `ProductID` 11:*
```sql
SELECT SUM(Quantity)
FROM OrderDetails
WHERE ProductId = 11;
```

!!! example Example

*Name the column "total":*
```sql
SELECT SUM(Quantity) AS total
FROM OrderDetails;
```

Here we use the `SUM()` function and the `GROUP BY` clause, to return the `Quantity` for each `OrderID` in the OrderDetails table:

!!! example Example

```sql
SELECT OrderID, SUM(Quantity) AS [Total Quantity]
FROM OrderDetails
GROUP BY OrderID;
```

The parameter inside the `SUM()` function can also be an expression.

If we assume that each product in the `OrderDetails` column costs 10 dollars, we can find the total earnings in dollars by multiply each quantity with 10:

!!! example Example

*Use an expression inside the `SUM()` function:*
```sql
SELECT SUM(Quantity * 10)
FROM OrderDetails;
```

We can also join the `OrderDetails` table to the `Products` table to find the actual amount, instead of assuming it is 10 dollars:

!!! example Example

*Join `OrderDetails` with `Products`, and use `SUM()` to find the total amount:*
```sql
SELECT SUM(Price * Quantity)
FROM OrderDetails
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID;
```

## Procedure Handlers

### Handle successful operation

```sql
DELIMITER //

CREATE PROCEDURE add_player(
  IN p_full_name VARCHAR(255),
  IN p_age INT,
  IN p_gender ENUM('m', 'f'),
  IN p_city_id INT UNSIGNED,
  IN p_category_title VARCHAR(100)
)
BEGIN
  DECLARE v_category_id INT UNSIGNED;
  DECLARE v_result_message VARCHAR(255);

  -- Получаем ID титула по его названию
  SELECT id INTO v_category_id
      FROM category
      WHERE title = p_category_title;

-- Проверяем, найден ли титул
IF v_category_id IS NOT NULL THEN
  -- Добавляем нового шахматиста в таблицу players
    INSERT INTO player (full_name, age, gender, city_id, category_id)
    VALUES (p_full_name, p_age, p_gender, p_city_id, v_category_id);
    IF ROW_COUNT() > 0 THEN
        SET v_result_message = 'Игрок успешно добавлен.';
    ELSE
        SET v_result_message = 'Ошибка: Игрок не был добавлен.';
    END IF;
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Звание не найдено';
END IF;

-- Возврат сообщения о результате операции
SELECT v_result_message AS result_message;
END //

DELIMITER ;

CALL add_player('Каспаров Гарри Каримович', 61, 'm', 5, 'чемпион мира');
```

Строка `SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Титул не найден';` используется в MySQL для генерации пользовательского исключения. Давайте разберем её по частям:
1. `SIGNAL SQLSTATE '45000'`
   - `SIGNAL`: Это оператор, который используется для создания ошибок или предупреждений в хранимых процедурах, триггерах и функциях.
   - `SQLSTATE '45000'`: Этот код обозначает "необработанное определяемое пользователем исключение". Он используется для сигнализации об ошибках, которые не соответствуют стандартным состояниям ошибок SQL. Код '45000' является общепринятым для пользовательских исключений и позволяет разработчикам явно указывать, что произошла ошибка, которую они сами определили.
2. `SET MESSAGE_TEXT = 'Титул не найден'`
   - `SET MESSAGE_TEXT`: Эта часть устанавливает текст сообщения, которое будет возвращено вместе с исключением. Это сообщение будет отображаться пользователю или системе, вызывающей процедуру.
   - `'Титул не найден'`: Это конкретное сообщение об ошибке, которое объясняет причину возникновения исключения. В данном случае оно указывает на то, что запрашиваемый титул шахматиста не был найден в базе данных.

*Применение*

Использование этой строки позволяет разработчикам:
- Обрабатывать ошибки более информативно, предоставляя пользователям ясные сообщения о том, что пошло не так.
- Упрощать отладку и улучшать взаимодействие с пользователями, так как они получают конкретную информацию о проблемах.

Таким образом, эта конструкция является важным инструментом для управления ошибками в MySQL и помогает поддерживать качество и надежность баз данных.

Общие классы и примеры `SQLSTATE`
1. Класс **`00`**: Успешное выполнение / Success
   - `00000`: Успешное завершение операции.
2. Класс **`01`**: Предупреждение / Warning
   - `01000`: Общее предупреждение.
3. Класс **`02`**: Нет данных / Not found
   - `02000`: Нет данных (например, при выполнении запроса, который не вернул результатов).

**Exceptions**

4. Класс **`23`**: Нарушение ограничений
   - `23000`: Нарушение ограничения уникальности.
   - `23505`: Дублирование значения в уникальном поле.
5. Класс **`42`**: Синтаксическая ошибка или нарушение доступа
   - `42000`: Синтаксическая ошибка в SQL-запросе.
   - `42601`: Ошибка синтаксиса.
6. Класс **`28`**: Неправильная аутентификация
   - `28000`: Неправильные учетные данные для доступа к базе данных.
7. Класс **`P0`**: Процедурные ошибки логики
   - `P0001`: Создание пользовательского исключения.
   - `P0002`: Ошибка в логике процедуры.

*Примеры пользовательских исключений*

Пользователь может определить собственные значения `SQLSTATE`, используя диапазоны, например:
- `45000` — общая ошибка, определяемая пользователем, как в вашем примере.
- Другие коды могут быть определены в зависимости от специфики приложения и его требований.

### Handle duplicated entries, unexpected exceptions

```sql
DELIMITER //

CREATE PROCEDURE AddGenre(IN title VARCHAR(63), OUT added_id INT UNSIGNED)
BEGIN
    DECLARE affected_rows INT UNSIGNED DEFAULT 0;

    DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SELECT CONCAT("Duplicate entry for '", title, "'") AS `Error (duplicate)`;
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT CONCAT("Error adding the genre ", title) AS `Error (unexpected)`;
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO genre VALUE (DEFAULT, title);
    SET affected_rows = ROW_COUNT();
    SET added_id = LAST_INSERT_ID();
    SELECT CONCAT("Successfully added the genre '", title, "' with ID: ", added_id) AS Success;

    COMMIT;

END//

DELIMITER ;

CALL AddGenre('фантастика', @created_id);

SELECT @created_id;

DROP PROCEDURE AddGenre;
```

### Capture error messages
In MySQL, you can capture error messages in a stored procedure using the GET DIAGNOSTICS statement within an error handler. This allows you to retrieve information about the error that occurred, such as the SQLSTATE value and the error message.

*Example of Capturing Error Messages in a Stored Procedure*

Here’s how you can define a stored procedure that captures error messages when an exception occurs:
```sql
DELIMITER //

CREATE PROCEDURE example_procedure()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Declare variables to hold error information
        DECLARE v_sqlstate CHAR(5);
        DECLARE v_errno INT;
        DECLARE v_message TEXT;

        -- Get diagnostics information
        GET DIAGNOSTICS CONDITION 1
            v_sqlstate = RETURNED_SQLSTATE,
            v_errno = MYSQL_ERRNO,
            v_message = MESSAGE_TEXT;

        -- You can log the error or handle it as needed
        SELECT CONCAT('SQLSTATE: ', v_sqlstate, ', Error Number: ', v_errno, ', Message: ', v_message) AS error_info;
    END;

    -- Example operation that may cause an error
    -- Attempt to insert a duplicate key (for demonstration)
    INSERT INTO some_table (id, name) VALUES (1, 'Sample Name');
END //

DELIMITER ;
```

### Roll back

If you define exit handler for SQLException, it will roll back the transaction SILENTLY, getting `Query OK, 0 rows affected (0.00 sec)` message:

```sql
DELIMITER //

CREATE PROCEDURE AddBrand(IN brand_title VARCHAR(31), OUT added_id INT UNSIGNED)
BEGIN

    DECLARE exit handler FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO brand VALUE (DEFAULT, brand_title);
    SET added_id = LAST_INSERT_ID();
    SELECT CONCAT("Successfully added the entry '", brand_title, "' with ID: ", added_id) AS Success;

    COMMIT;
END//

DELIMITER ;
```

### `NOT FOUND` handler and `DELETE`
In MySQL, the NOT FOUND condition is a specific type of handler that is used primarily for managing situations where a query does not return any rows, particularly in the context of cursors. 

Consider this case with the `DELETE` statement:
```sql
DELIMITER //

CREATE PROCEDURE DeleteBrand(IN brand_id INT UNSIGNED, OUT deleted_id INT UNSIGNED)
BEGIN

    DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        SELECT "Not found";
    END;

    DELETE FROM brand WHERE id = brand_id;
END//

DELIMITER ;
```

The `NOT FOUND` handler is not triggered for the following reasons:
1. `DELETE` Statement Behavior:

  The `DELETE` statement itself does not raise a `NOT FOUND` condition if no rows match the criteria. Instead, it simply performs no action and completes successfully. The absence of matching rows does not constitute an error or condition that would invoke the handler.

2. Use of Handlers:

  The `NOT FOUND` handler is primarily relevant when working with cursors or when using statements that explicitly return no data (like `SELECT ... INTO`). For operations like `DELETE`, you typically check how many rows were affected using `ROW_COUNT()` or similar methods.

#### Alternative Approach
If you want to handle cases where no rows were deleted and provide feedback accordingly, you can check the number of affected rows after the `DELETE` operation:
```sql
DELIMITER //

CREATE PROCEDURE DeleteBrand(IN brand_id INT UNSIGNED)
BEGIN
    DECLARE affected_rows INT;

    DELETE FROM brand WHERE id = brand_id;
    SET affected_rows = ROW_COUNT();

    IF affected_rows = 0 THEN
        SELECT "Not found" AS message;
    ELSE
        SELECT CONCAT("Deleted brand with ID: ", brand_id) AS message;
    END IF;
END//

DELIMITER ;
```

## Using `FOUND_ROWS()`
The `FOUND_ROWS()` function in MySQL is used to retrieve the number of rows that would have been returned by a previous `SELECT` statement if it had not included a `LIMIT` clause. This function is particularly useful in pagination scenarios where you want to know the total number of rows that match a query condition, even if you're only displaying a subset of those rows.

Key Points About `FOUND_ROWS()`:
1. Usage with `SQL_CALC_FOUND_ROWS`:

    To use `FOUND_ROWS()`, you typically pair it with the `SQL_CALC_FOUND_ROWS` option in your `SELECT` statement. This instructs MySQL to calculate the total number of matching rows without the limit.

    Example:
    ```sql
    SELECT SQL_CALC_FOUND_ROWS * FROM your_table WHERE some_condition LIMIT 10;
    SELECT FOUND_ROWS();
    ```

    The first query retrieves up to 10 rows based on the condition, while the second query returns the total count of rows that match the condition without considering the limit.

2. Behavior Without `SQL_CALC_FOUND_ROWS`:

    If you call `FOUND_ROWS()` after a `SELECT` statement that does not use `SQL_CALC_FOUND_ROWS`, it returns the number of rows processed by the last statement, which may not be meaningful in terms of matching records.

    For example, if you run:
    ```sql
    SELECT * FROM your_table LIMIT 10;
    SELECT FOUND_ROWS();
    ```

    The second call will return the number of rows processed by the previous query, which is 10 (the limit), rather than the total number of matching rows.

3. Considerations with `UNION`:

    When using `UNION`, `SQL_CALC_FOUND_ROWS` can behave differently. If you use `UNION ALL`, it will count all rows correctly. However, if you use `UNION` without `ALL`, it will eliminate duplicates and may lead to inaccurate counts since `FOUND_ROWS()` will reflect only the unique results after unioning.

    For accurate results when using `UNION`, it's recommended to apply `SQL_CALC_FOUND_ROWS` only on the first part of the union.

4. Performance:

    sing `SQL_CALC_FOUND_ROWS` can lead to performance overhead because MySQL has to calculate and store the total count in memory. In scenarios with large datasets or complex queries, consider using separate count queries for better performance.

Summary:
1. Functionality: `FOUND_ROWS()` provides a way to retrieve the total count of rows that would be returned by a query without limits.
2. Pairing with `SQL_CALC_FOUND_ROWS`: Always use it in conjunction with `SQL_CALC_FOUND_ROWS` for meaningful results.
3. Behavior with `UNION`: Be cautious when using it with `UNION`; prefer `UNION ALL` for accurate counts.
4. Performance Considerations: Evaluate performance impacts when using this feature, especially with large datasets.

This functionality is particularly useful for implementing pagination in applications where knowing both the current page's data and the total available records is essential for user navigation and experience.

## Regular expressions (`REGEXP()`)

### Using Backslash
In MySQL, the use of double backslashes in regular expressions is necessary due to how strings and escape sequences are processed at different levels. Here’s a detailed explanation of why you need to use double backslashes in your regular expression:
1. Escaping in Strings

    When you write a string in SQL, certain characters, including the backslash (`\`), have special meanings. To include a literal backslash in a string, you need to escape it. This is done by using another backslash:
    - Single Backslash: `\`
    - Double Backslash: `\\` (This represents a single backslash in the actual string)

2. Regular Expressions

    Regular expressions themselves also use the backslash as an escape character. For example:
    - To match a literal dot (`.`), you would write `\.` in a regex.
    - To match a whitespace character, you would use `\s`.

3. Combining Both Levels

    When you combine these two layers (the string layer and the regex layer), you end up needing to escape the backslash twice:
    - In the SQL String: You need to write `\\` to represent a single backslash.
    - In the Regex: If you want to express something like `\s` (to match whitespace), you must write it as `\\s` in your SQL string.

#### Example Breakdown

For your specific case with the regex pattern:
```sql
CONSTRAINT chk_car_license_plate CHECK(license_plate REGEXP '^[а-я]{1}\\d{3}[а-я]{2}\\d{2,3}$')
```

- The first `\\` becomes a single `\` when interpreted by MySQL.
- The regex engine then sees this as `\d`, which matches any digit.

#### Summary of Why Double Backslashes Are Needed
- **String Escaping**: In SQL strings, backslashes must be escaped with another backslash.
- **Regex Escaping**: In regex patterns, certain characters must also be escaped with a backslash.
- **Final Interpretation**: Therefore, when writing regex patterns within SQL strings, each backslash must be doubled to ensure that it is interpreted correctly by both the SQL parser and the regex engine.

#### Conclusion
The requirement for double backslashes is common in many programming languages and environments where escape sequences are processed at multiple levels. Understanding this concept helps avoid confusion when working with regular expressions in SQL or any other context that involves nested escaping.

## Run scripts
https://stackoverflow.com/questions/8940230/how-to-run-sql-script-in-mysql

If you’re at the MySQL command line `mysql>` you have to declare the SQL file as source.
```
mysql> source \home\user\Desktop\test.sql;
```

Use the MySQL command line client:
```
mysql -h hostname -u user database < path/to/test.sql
```

The other option to do that will be: `mysql --user="username" --database="databasename" --password="yourpassword" < "filepath"`:
```
mysql -u yourusername -p yourpassword a_new_database_name < text_file
```

All the top answers are good. But just in case someone wants to run the query from a text file on a remote server **AND** save results to a file (instead of showing on console), you can do this:
```
mysql -u yourusername -p yourpassword yourdatabase < query_file > results_file
```
