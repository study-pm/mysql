# Практическая работа 4.2. Разработка серверной части данных в СУБД MySQL. Изменение структуры таблиц

- [1. Цель работы](#1-цель-работы)
- [2. Условия задач](#2-условия-задач)
- [3. Решение задач](#3-решение-задач)
  - [3.1 Задача 1](#31-задача-1)
  - [3.2 Задача 2](#32-задача-2)
  - [3.3 Задача 3](#33-задача-3)
  - [3.4 Задача 4](#34-задача-4)
  - [3.5 Задача 5](#35-задача-5)
  - [3.6 Задача 6](#36-задача-6)
  - [3.7 Задача 7](#37-задача-7)
  - [3.8 Задача 8](#38-задача-8)
  - [3.9 Задача 9](#39-задача-9)
  - [3.10 Задача 10](#310-задача-10)
  - [3.11 Задача 11](#311-задача-11)
  - [3.12 Задача 12](#312-задача-12)
- [Заключение](#заключение)

## 1. Цель работы
- изучить основные положения теории баз данных, хранилищ данных, баз знаний;
- изучить методы описания схем баз данных в современных СУБД;
- сформировать умение создавать объекты баз данных в современных СУБД.

## 2. Условия задач
1) Cоздать таблицу с клиентами `clients (name varchar(20), age int, dolgnost vachar(15), dolgnost varchar(10))`.
2) Вставить в таблицу два поля `telephon char(11)` и `Name varchar(30)`.
3) Добавить уникальный индекс для поля `telephon` и простой индекс для поля `age`.
4) Изменить тип поля `dolgnost` на `char(12)` в таблице `client`.
5) Создать таблицу `ctrana(nazv_ctr varcar(10))`.
6) Добавить ключевое поле `id_c int` в таблицу `clients` и ключевое `поле id_c` в таблицу `ctrana`.
7) Добавить простой индекс для поля `age` и поставить его перед полем `name`.
8) Изменить имя и размер текстового поля `nazv_ctr` на `nazv_country varchar(20)` в таблице `ctrana`.
9) Переименовать поле `dolgnost` таблицы `clients` в `post` типа `varchar(15)`.
10) Добавить в таблицу `clients` внешний ключ `id_d` c `ON UPDATE RESTRICT`.
11) Удалить поле `dolgnost` из таблицы `clients`.
12) Переименовать таблицу `ctrana` в `country`.

## 3. Решение задач

### 3.1 Задача 1
Cоздать таблицу с клиентами `clients (name varchar(20), age int, dolgnost vachar(15), dolgnost varchar(10))`. Листинг 1 демонстрирует команду создания, активации базы данных и создания таблицы.

*[Листинг 1 – Команды создания базы данных и таблицы](./01.sql)*
```sql
CREATE DATABASE mytest;

USE mytest

CREATE TABLE clients (name VARCHAR(20), age INT, dolgnost VARCHAR(15));
```

Рисунок 1 иллюстрирует ход создания базы данных.

```
mysql> CREATE DATABASE mytest;
Query OK, 1 row affected (0.00 sec)

mysql> USE mytest
Database changed
```

*Рисунок 1 – Создание базы данных*

Рисунок 2 иллюстрирует ход создания таблицы с клиентами.

```
mysql> CREATE TABLE clients (name VARCHAR(20), age INT, dolgnost VARCHAR(15), dolgnost VARCHAR(10));
ERROR 1060 (42S21): Duplicate column name 'dolgnost'
mysql> CREATE TABLE clients (name VARCHAR(20), age INT, dolgnost VARCHAR(15));
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE clients;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | YES  |     | NULL    |       |
| age      | int         | YES  |     | NULL    |       |
| dolgnost | varchar(15) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
```

*Рисунок 2 – Создание таблицы с клиентами*

### 3.2 Задача 2
Вставить в таблицу два поля `telephon char(11)` и `Name varchar(30)`. Листинг 1 демонстрирует команду вставки поля.

*[Листинг 2 – Команда вставки поля](./02.sql)*
```sql
ALTER TABLE clients ADD COLUMN telephon CHAR(11);
```

Рисунок 3 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients ADD COLUMN telephon CHAR(11), ADD COLUMN Name VARCHAR(30);
ERROR 1060 (42S21): Duplicate column name 'Name'
mysql> ALTER TABLE clients ADD COLUMN telephon CHAR(11);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE clients;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | YES  |     | NULL    |       |
| age      | int         | YES  |     | NULL    |       |
| dolgnost | varchar(15) | YES  |     | NULL    |       |
| telephon | char(11)    | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
```

*Рисунок 3 – Вставка поля*

### 3.3 Задача 3
Добавить уникальный индекс для поля `telephon` и простой индекс для поля `age`. Листинг 3 демонстрирует скрипт запроса.

*[Листинг 3 – Команда вставки индексов](./03.sql)*
```sql
ALTER TABLE clients
    ADD UNIQUE INDEX (telephon),
    ADD INDEX (age)
;
```

Рисунок 4 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients ADD UNIQUE INDEX(telephon), ADD INDEX(age);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE clients;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | YES  |     | NULL    |       |
| age      | int         | YES  | MUL | NULL    |       |
| dolgnost | varchar(15) | YES  |     | NULL    |       |
| telephon | char(11)    | YES  | UNI | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> SHOW INDEX in clients;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clients |          0 | telephon |            1 | telephon    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clients |          1 | age      |            1 | age         | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.00 sec)
```

*Рисунок 4 – Добавление индексов*

### 3.4 Задача 4
Изменить тип поля `dolgnost` на `char(12)` в таблице `client`. Листинг 4 демонстрирует скрипт запроса.

*[Листинг 4 – Команда изменения типа поля](./04.sql)*
```sql
ALTER	TABLE clients MODIFY dolgnost CHAR(12);
```

Рисунок 5 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients MODIFY dolgnost CHAR(12);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe clients;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | YES  |     | NULL    |       |
| age      | int         | YES  | MUL | NULL    |       |
| dolgnost | char(12)    | YES  |     | NULL    |       |
| telephon | char(11)    | YES  | UNI | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
```

*Рисунок 5 – Изменение типа поля*

### 3.5 Задача 5
Создать таблицу `ctrana(nazv_ctr varchar(10))`. Листинг 5 демонстрирует скрипт запроса.

*[Листинг 5 – Команда создания таблицы](./05.sql)*
```SQL
CREATE TABLE ctrana(nazv_ctr varchar(10));
```

Рисунок 6 иллюстрирует результат выполнения запроса.

```
mysql> CREATE TABLE ctrana(nazv_ctr varchar(10));
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE ctrana;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| nazv_ctr | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
1 row in set (0.00 sec)
```

*Рисунок 6 – Создание таблицы*

### 3.6 Задача 6
Добавить ключевое поле `id_c int` в таблицу clients и ключевое поле `id_c` в таблицу `ctrana`. Листинг 6 демонстрирует скрипт запроса.

*[Листинг 6 – Команды добавления ключевых полей](./06.sql)*
```sql
ALTER	TABLE clients
	ADD id_cint INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER	TABLE ctrana
	ADD id_c INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
```

Рисунок 7 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients ADD id_c INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_c     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20)  | YES  |     | NULL    |                |
| age      | int          | YES  | MUL | NULL    |                |
| dolgnost | char(12)     | YES  |     | NULL    |                |
| telephon | char(11)     | YES  | UNI | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE ctrana ADD id_c INT UNSIGNED AUTO_INCREMENT PRIMARY KEY FIRST;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE ctrana;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_c     | int unsigned | NO   | PRI | NULL    | auto_increment |
| nazv_ctr | varchar(10)  | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)
```

*Рисунок 7 – Добавление ключевых полей*

### 3.7 Задача 7
Добавить простой индекс для поля `age` и поставить его перед полем `name`. Листинг 7 демонстрирует скрипт запроса.

*[Листинг 7 – Команда добавления простого индекса](./07.sql)*
```sql
ALTER	TABLE clients
	ADD INDEX (age),
	MODIFY COLUMN age INT AFTER id_cint
	;
```

Рисунок 8 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients     ADD INDEX (age),     MODIFY COLUMN age INT AFTER id_c ;
Query OK, 0 rows affected, 1 warning (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> DESCRIBE clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_c     | int unsigned | NO   | PRI | NULL    | auto_increment |
| age      | int          | YES  | MUL | NULL    |                |
| name     | varchar(20)  | YES  |     | NULL    |                |
| dolgnost | char(12)     | YES  |     | NULL    |                |
| telephon | char(11)     | YES  | UNI | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> SHOW INDEXES FROM clients;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clients |          0 | PRIMARY  |            1 | id_c        | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clients |          0 | telephon |            1 | telephon    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clients |          1 | age      |            1 | age         | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clients |          1 | age_2    |            1 | age         | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.00 sec)
```

### 3.8 Задача 8
Изменить имя и размер текстового поля `nazv_ctr` на `nazv_country varchar(20)` в таблице `ctrana`. Листинг 8 демонстрирует скрипт запроса.

*[Листинг 8 – Команда изменения поля](./08.sql)*
```sql
ALTER TABLE ctrana CHANGE nazv_ctr nazv_country VARCHAR(20);
```

Рисунок 9 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE ctrana CHANGE nazv_ctr nazv_country VARCHAR(20);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM ctrana;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id_c         | int unsigned | NO   | PRI | NULL    | auto_increment |
| nazv_country | varchar(20)  | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)
```

*Рисунок 9 – Изменение поля*

### 3.9 Задача 9
Переименовать поле `dolgnost` таблицы `clients` в `post` типа `varchar(15)`. Листинг 9 демонстрирует скрипт запроса.

*[Листинг 9 – Команда изменения поля](./09.sql)*
```sql
ALTER TABLE clients CHANGE COLUMN dolgnost post VARCHAR(15);
```

Рисунок 10 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients CHANGE COLUMN dolgnost post VARCHAR(15);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_c     | int unsigned | NO   | PRI | NULL    | auto_increment |
| age      | int          | YES  | MUL | NULL    |                |
| name     | varchar(20)  | YES  |     | NULL    |                |
| post     | varchar(15)  | YES  |     | NULL    |                |
| telephon | char(11)     | YES  | UNI | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)
```

*Рисунок 10 – Изменение поля*

### 3.10 Задача 10
Добавить в таблицу `clients` внешний ключ `id_d` c `ON UPDATE RESTRICT`. Листинг 10 демонстрирует скрипт запроса.

*[Листинг 10 – Команды добавления внешнего ключа](./10.sql)*
```sql
ALTER TABLE clients
	ADD id_d INT UNSIGNED,
	ADD FOREIGN KEY (id_d) REFERENCES ctrana (id_c) ON UPDATE RESTRICT
;
```

Рисунок 11 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients
    -> ADD id_d INT UNSIGNED,
    -> ADD FOREIGN KEY (id_d) REFERENCES ctrana (id_c) ON UPDATE RESTRICT;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE clients;
+---------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table

                                                                     |
+---------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| clients | CREATE TABLE `clients` (
  `id_c` int unsigned NOT NULL AUTO_INCREMENT,
  `age` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `post` varchar(15) DEFAULT NULL,
  `telephon` char(11) DEFAULT NULL,
  `id_d` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_c`),
  UNIQUE KEY `telephon` (`telephon`),
  KEY `age` (`age`),
  KEY `age_2` (`age`),
  KEY `id_d` (`id_d`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_d`) REFERENCES `ctrana` (`id_c`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
```

*Рисунок 11 – Добавление внешнего ключа*

### 3.11 Задача 11
Удалить поле `dolgnost` из таблицы `clients`. Листинг 11 демонстрирует скрипт запроса.

*[Листинг 11 – Команда удаление поля](./11.sql)*
```sql
ALTER TABLE clients DROP COLUMN post;
```

Рисунок 12 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE clients DROP COLUMN dolgnost;
ERROR 1091 (42000): Can't DROP 'dolgnost'; check that column/key exists
mysql> ALTER TABLE clients DROP COLUMN post;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_c     | int unsigned | NO   | PRI | NULL    | auto_increment |
| age      | int          | YES  | MUL | NULL    |                |
| name     | varchar(20)  | YES  |     | NULL    |                |
| telephon | char(11)     | YES  | UNI | NULL    |                |
| id_d     | int unsigned | YES  | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)
```

*Рисунок 12 – Удаление поля*

### 3.12 Задача 12
Переименовать таблицу `ctrana` в `country`. Листинг 12 демонстрирует скрипт запроса.

*[Листинг 12 – Команда переименования таблицы](./12.sql)*
```sql
ALTER TABLE ctrana RENAME country;
```

Рисунок 12 иллюстрирует результат выполнения запроса.

```
mysql> ALTER TABLE ctrana RENAME country;
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW TABLES;
+------------------+
| Tables_in_mytest |
+------------------+
| clients          |
| country          |
+------------------+
2 rows in set (0.00 sec)
```

*Рисунок 13 – Переименование таблицы*

## Заключение
По итогам работы были изучены основные положения теории баз данных, хранилищ данных, баз знаний; изучены методы описания схем баз данных в современных СУБД, сформировано умение создавать объекты баз данных в современных СУБД. В ходе работы были произведены следующие изменения в структуре созданных таблиц:
1) Изменено название таблицы.
2) Добавлен новый столбец в таблицу
3) Изменено имя и тип поля таблицы
4) Переименовано имя поля таблицы
5) Изменен размер поля таблицы
6) Удален столбец таблицы
7) Добавлен простой индекс в таблицу
8) Добавлен уникальный индекс в таблицу
9) Добавлено ключевое поле в таблицу
10) Добавлен внешний ключ таблицы
