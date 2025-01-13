# Практическая работа 2.2. Работа в консольном клиенте СУБД MySQL

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
  - [3.13 Задача 13](#313-задача-13)
  - [3.14 Задача 14](#314-задача-14)
  - [3.15 Задача 15](#315-задача-15)
- [Заключение](#заключение)

## 1. Цель работы
- изучить основные команды для работы в среде современной СУБД;
- сформировать умение работать в средах современных СУБД.

## 2. Условия задач
1. Войти в консоль MySQL.
2. Посмотреть базы данных, которые есть на сервере.
3. Сделать текущей одну из БД.
4. Посмотреть, есть ли у нее таблицы. Если есть, то посмотреть структуры таблиц, если нет, то посмотреть другую БД.
5. Создать базу данных (любое имя, например, DBsalon).
6. Посмотреть наличие созданной БД на сервере.
7. Сделать эту базу текущей.
8. Посмотреть настройки текущей БД.
9. Создать таблицу.
10. Посмотреть структуру этой таблицы.
11. Добавить данные в таблицу.
12. Вывести данные из созданной таблицы.
13. Удалить созданную таблицу.
14. Удалить созданную БД.
15. Посмотреть БД, которые остались на сервере.

## 3. Решение задач

### 3.1 Задача 1
Войти в консоль MySQL.

*Листинг 1 – Команда входа в консоль*
```sql
mysql -u root
```

Рисунок 1 иллюстрирует вход в консоль MySQL.

```
 c:\ospanel
# mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

*Рисунок 1 – Создание базы данных*

### 3.2 Задача 2
Посмотреть базы данных, которые есть на сервере.

*[Листинг 2 – Команда просмотра баз данных](./01.sql)*
```sql
SHOW DATABASES;
```

Рисунок 2 иллюстрирует результат выполнения запроса.

```
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

```

*Рисунок 2 – Просмотр баз данных*

### 3.3 Задача 3
Сделать текущей одну из БД.

*[Листинг 3 – Установка текущей базы данных](./02.sql)*
```sql
USE mysql
```

Рисунок 3 иллюстрирует результат выполнения команды.

```
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

*Рисунок 3 – Установка текущей базы данных с последующей проверкой*

### 3.4 Задача 4
Посмотреть, есть ли у нее таблицы. Если есть, то посмотреть структуры таблиц, если нет, то посмотреть другую БД.

*[Листинг 4 – Команда изменения типа поля](./03.sql)*
```sql
ALTER	TABLE clients MODIFY dolgnost CHAR(12);
```

Рисунок 4 иллюстрирует результат выполнения запроса.

```
mysql> SHOW TABLES;
+------------------------------------------------------+
| Tables_in_mysql                                      |
+------------------------------------------------------+
| columns_priv                                         |
| component                                            |
| db                                                   |
| default_roles                                        |
| engine_cost                                          |
| func                                                 |
| general_log                                          |
| global_grants                                        |
| gtid_executed                                        |
| help_category                                        |
| help_keyword                                         |
| help_relation                                        |
| help_topic                                           |
| innodb_index_stats                                   |
| innodb_table_stats                                   |
| password_history                                     |
| plugin                                               |
| procs_priv                                           |
| proxies_priv                                         |
| replication_asynchronous_connection_failover         |
| replication_asynchronous_connection_failover_managed |
| replication_group_configuration_version              |
| replication_group_member_actions                     |
| role_edges                                           |
| server_cost                                          |
| servers                                              |
| slave_master_info                                    |
| slave_relay_log_info                                 |
| slave_worker_info                                    |
| slow_log                                             |
| tables_priv                                          |
| time_zone                                            |
| time_zone_leap_second                                |
| time_zone_name                                       |
| time_zone_transition                                 |
| time_zone_transition_type                            |
| user                                                 |
+------------------------------------------------------+
37 rows in set (0.01 sec)

mysql> DESCRIBE db;
+-----------------------+---------------+------+-----+---------+-------+
| Field                 | Type          | Null | Key | Default | Extra |
+-----------------------+---------------+------+-----+---------+-------+
| Host                  | char(255)     | NO   | PRI |         |       |
| Db                    | char(64)      | NO   | PRI |         |       |
| User                  | char(32)      | NO   | PRI |         |       |
| Select_priv           | enum('N','Y') | NO   |     | N       |       |
| Insert_priv           | enum('N','Y') | NO   |     | N       |       |
| Update_priv           | enum('N','Y') | NO   |     | N       |       |
| Delete_priv           | enum('N','Y') | NO   |     | N       |       |
| Create_priv           | enum('N','Y') | NO   |     | N       |       |
| Drop_priv             | enum('N','Y') | NO   |     | N       |       |
| Grant_priv            | enum('N','Y') | NO   |     | N       |       |
| References_priv       | enum('N','Y') | NO   |     | N       |       |
| Index_priv            | enum('N','Y') | NO   |     | N       |       |
| Alter_priv            | enum('N','Y') | NO   |     | N       |       |
| Create_tmp_table_priv | enum('N','Y') | NO   |     | N       |       |
| Lock_tables_priv      | enum('N','Y') | NO   |     | N       |       |
| Create_view_priv      | enum('N','Y') | NO   |     | N       |       |
| Show_view_priv        | enum('N','Y') | NO   |     | N       |       |
| Create_routine_priv   | enum('N','Y') | NO   |     | N       |       |
| Alter_routine_priv    | enum('N','Y') | NO   |     | N       |       |
| Execute_priv          | enum('N','Y') | NO   |     | N       |       |
| Event_priv            | enum('N','Y') | NO   |     | N       |       |
| Trigger_priv          | enum('N','Y') | NO   |     | N       |       |
+-----------------------+---------------+------+-----+---------+-------+
22 rows in set (0.00 sec)

```

*Рисунок 4 – Просмотр таблиц*

### 3.5 Задача 5
Создать базу данных (любое имя, например, `DBsalon`).

*[Листинг 5 – Команда создания таблицы](./04.sql)*
```SQL
CREATE DATABASE DBsalon;
```

Рисунок 5 иллюстрирует результат выполнения запроса.

```
mysql> CREATE DATABASE DBsalon;
Query OK, 1 row affected (0.00 sec)
```

*Рисунок 5 – Создание базы данных*

### 3.6 Задача 6
Посмотреть наличие созданной БД на сервере.

*[Листинг 6 – Команда проверки наличия БД](./05.sql)*
```sql
SHOW DATABASES LIKE 'DBsalon';
```

Рисунок 6 иллюстрирует результат выполнения запроса.

```
mysql> SHOW DATABASES LIKE 'DBsalon';
+--------------------+
| Database (DBsalon) |
+--------------------+
| DBsalon            |
+--------------------+
1 row in set (0.00 sec)
```

*Рисунок 6 – Проверка наличия созданной БД*

### 3.7 Задача 7
Сделать эту базу текущей.

*[Листинг 7 – Команда установки текущей БД](./06.sql)*
```sql
USE DBsalon;
```

Рисунок 7 иллюстрирует результат выполнения запросов.

```
mysql> USE DBSalon;
Database changed
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| dbsalon    |
+------------+
1 row in set (0.00 sec)
```

*Рисунок 7 – Установка и проверка текущей БД*

### 3.8 Задача 8
Посмотреть настройки текущей БД.

*[Листинг 8 – Команда просмотра настроек БД](./07.sql)*
```sql
SHOW CREATE DATABASE dbsalon;
```

Рисунок 9 иллюстрирует результат выполнения запроса.

```
mysql> SHOW CREATE DATABASE dbsalon;
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
| Database | Create Database                                                                                                                   |
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
| dbsalon  | CREATE DATABASE `dbsalon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+----------+-----------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

*Рисунок 8 – Просмотр настроек текущей БД*

### 3.9 Задача 9
Создать таблицу.

*[Листинг 9 – Команда создания таблицы](./08.sql)*
```sql
CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(30), age INT);
```

Рисунок 9 иллюстрирует результат выполнения запроса.

```
mysql> CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(30), age INT);
Query OK, 0 rows affected (0.01 sec)
```

*Рисунок 9 – Создание таблицы*

### 3.10 Задача 10
Посмотреть структуру этой таблицы.

*[Листинг 10 – Команды просмотра структуры таблицы](./09.sql)*
```sql
DESCRIBE users;
```

Рисунок 10 иллюстрирует результат выполнения запроса.

```
mysql> DESCRIBE users;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(30) | YES  |     | NULL    |                |
| age   | int         | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)
```

*Рисунок 10 – Просмотр структуры таблицы*

### 3.11 Задача 11
Добавить данные в таблицу.

*[Листинг 10 – Команда добавления данных](./10.sql)*
```sql
INSERT INTO users (name, age) VALUES ('Nick', 25), ('Tom', 34), ('Angelica', 21);
```

Рисунок 11 иллюстрирует результат выполнения запроса.

```
mysql> INSERT INTO users (name, age) VALUES ('Nick', 25), ('Tom', 34), ('Angelica', 21);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

*Рисунок 11 – Добавление данных в таблицу*

### 3.12 Задача 12
Вывести данные из созданной таблицы.

*[Листинг 12 – Команда вывода данных](./11.sql)*
```sql
SELECT * FROM users;
```

Рисунок 12 иллюстрирует результат выполнения запроса.

```
mysql> SELECT * FROM users;
+----+----------+------+
| id | name     | age  |
+----+----------+------+
|  1 | Nick     |   25 |
|  2 | Tom      |   34 |
|  3 | Angelica |   21 |
+----+----------+------+
3 rows in set (0.00 sec)
```

*Рисунок 12 – Вывод данных из созданной таблицы*

### 3.13 Задача 13
Удалить созданную таблицу.

*[Листинг 12 – Команда удаления таблицы](./12.sql)*
```sql
DROP TABLE users;
```

Рисунок 13 иллюстрирует результат выполнения запроса.

```
mysql> DROP TABLE users;
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW TABLES;
Empty set (0.00 sec)
```

*Рисунок 13 – Удаление таблицы*

### 3.14 Задача 14
Удалить созданную БД.

*[Листинг 13 – Команда удаления БД](./13.sql)*
```sql
DROP DATABASE DBsalon;
```

Рисунок 14 иллюстрирует результат выполнения запроса.

```
mysql> DROP DATABASE DBsalon;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)
```

*Рисунок 14 – Удаление базы данных*

### 3.15 Задача 15
Посмотреть БД, которые остались на сервере.

*[Листинг 14 – Команда просмотра БД](./01.sql)*
```sql
SHOW DATABASES;
```

Рисунок 15 иллюстрирует результат выполнения запроса.

```
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)
```

*Рисунок 15 – Просмотр баз данных*

## Заключение
По итогам работы были изучены основные команды для работы в среде современной СУБД; сформировано умение работать в средах современных СУБД.
