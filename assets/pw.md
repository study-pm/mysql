# Практические работы

## Работа 2.O. «Работа в консольном клиенте СУБД MySQL»

### Задание 2.1.2

Используя команды, представленные в таблице, выполните пункты задания.
1. Войти в консоль MySQL
2. Посмотреть базы данных, которые есть на сервере
3. Сделать текущей одну из БД
4. Посмотреть, есть ли у нее таблицы. Если есть, то посмотреть структуры таблиц, если нет, то посмотреть другую БД.
5. Создать базу данных (любое имя, например, DBsalon)
6. Посмотреть наличие созданной БД на сервере
7. Сделать эту базу текущей.
8. Посмотреть настройки текущей БД.
9. Создать таблицу
10. Посмотреть структуру этой таблицы
11. Добавить данные в таблицу
12. Вывести данные из созданной таблицы
13. Удалить созданную таблицу
14. Удалить созданную БД
15. Посмотреть БД, которые остались на сервере

### Ход выполнения задания

1. Войти в консоль MySQL: `mysql -u root`

    <details>
    <summary><b>Result</b></summary>

    ```
    viktor@DESKTOP-H16DFJO c:\ospanel
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

    </details>

2. Посмотреть базы данных, которые есть на сервере: `show databases`.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> show databases;
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

    </details>

3. Сделать текущей одну из БД: `use` *`db_name`*:

   <details>
    <summary><b>Result</b></summary>

    ```
    mysql> use mysql
    Database changed
    ```

    </details>

4. Посмотреть, есть ли у нее таблицы: `show tables`. Если есть, то посмотреть структуры таблиц (`describe` *`table_name`*), если нет, то посмотреть другую БД.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> show tables;
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
    37 rows in set (0.09 sec)

    mysql> describe db;
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
    22 rows in set (0.09 sec)
    ```

    </details>

5. Создать базу данных (любое имя, например, DBsalon): `create database DBsalon`.

   <details>
    <summary><b>Result</b></summary>

    ```
    mysql> create database DBsalon;
    Query OK, 1 row affected (0.00 sec)
    ```

    </details>

6. Посмотреть наличие созданной БД на сервере: `show databases`.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | DBsalon            |
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    +--------------------+
    5 rows in set (0.00 sec)
    ```

    </details>

7. Сделать эту базу текущей: `use DBsalon`.

   <details>
    <summary><b>Result</b></summary>

    ```
    mysql> use DBsalon;
    Database changed
    ```

    </details>

8. Посмотреть настройки текущей БД.

9. Создать таблицу: `create table` *`table_name`* ([*`prop_name prop_type`*, ...]).

   <details>
    <summary><b>Result</b></summary>

    ```
    mysql> create table users (id int auto_increment primary key, name varchar(30), age int);
    Query OK, 0 rows affected (0.02 sec)
    ```

    </details>

10. Посмотреть структуру этой таблицы: `describe DBsalon`.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> describe users;
    +-------+-------------+------+-----+---------+----------------+
    | Field | Type        | Null | Key | Default | Extra          |
    +-------+-------------+------+-----+---------+----------------+
    | id    | int         | NO   | PRI | NULL    | auto_increment |
    | name  | varchar(30) | YES  |     | NULL    |                |
    | age   | int         | YES  |     | NULL    |                |
    +-------+-------------+------+-----+---------+----------------+
    3 rows in set (0.00 sec)
    ```

    </details>

11. Добавить данные в таблицу: `insert into users (`[*prop_name, ...*]`) values ` [`(`*value1*, ...`)`, ...].

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> insert into users (name, age) values ('Nick', 25), ('Tom', 34), ('Angelica', 21);
    Query OK, 3 rows affected (0.09 sec)
    Records: 3  Duplicates: 0  Warnings: 0
    ```

    </details>

12. Вывести данные из созданной таблицы: `select * from users`.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> select * from users;
    +----+----------+------+
    | id | name     | age  |
    +----+----------+------+
    |  1 | Nick     |   25 |
    |  2 | Tom      |   34 |
    |  3 | Angelica |   21 |
    +----+----------+------+
    3 rows in set (0.00 sec)
    ```

    </details>

13. Удалить созданную таблицу: `drop table users`.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> drop table users;
    Query OK, 0 rows affected (0.01 sec)
    ```

    </details>

14. Удалить созданную БД: `drop database DBsalon`.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> drop database DBsalon;
    Query OK, 0 rows affected (0.01 sec)
    ```

    </details>

15. Посмотреть БД, которые остались на сервере: `show databases`.

    <details>
    <summary><b>Result</b></summary>

    ```
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    +--------------------+
    4 rows in set (0.00 sec)
    ```

    </details>

### Итоговый алгоритм

```
mysql -u root
show databases;
use mysql;
show tables;
describe db;
create database DBsalon;
show databases;
use DBsalon;
describe users;
insert into users (name, age) values ('Nick', 25), ('Tom', 34), ('Angelica', 21);
drop table users;
drop database DBsalon;
show databases;
```

## Работа 3.O. «Создание таблиц»

### Задание 3.1.2

В соответствии с предметной областью своего варианта создайте таблицы, используя язык DDL.

#### Описание предметной области

**Вариант 2: Гостиница**

Гостиница предоставляет номера клиентам.  Каждый номер характеризуется вместимостью, комфортностью (люкс, полу люкс, обычный) и ценой.  О клиентах собирается определенная информация (фамилия, имя, отчество, паспортные данные, дата рождения, адрес жительства и некоторый комментарий).  Сдача номера (комфортность, количество человек, телефон) клиенту производится при наличии свободных мест в номерах, подходящих клиенту по указанным выше параметрам.  При заселении фиксируется дата заселения. При выезде из гостиницы для каждого места запоминается дата освобождения.Необходимо также осуществлять бронирование номеров.  Для постоянных клиентов, а также для определенных категорий клиентов предусмотрена система скидок. Скидки могут суммироваться.

### Ход выполнения задания

#### Составление инфологической модели

Полученная инфологическая модель предметной области представлена на рисунке 1.

![Рисунок 1 - Инфологическая модель предметной области](../img/infological_model.png)

#### Создание базы данных

```
mysql> CREATE DATABASE hotel;
Query OK, 1 row affected (0.00 sec)
```

#### Создание таблиц

<details>
<summary><b>Комфортабельность</b></summary>

```
mysql> CREATE TABLE comfort (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(10) NOT NULL CHECK(type_name != '')
);
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE comfort (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> type_name VARCHAR(10) NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE comfort;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| _id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| type_name | varchar(10)  | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
2 rows in set (0.01 sec)
```

</details>

<details>
<summary><b>Номера</b></summary>

```
mysql> CREATE TABLE room (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(10) NOT NULL UNIQUE,
    capacity TINYINT UNSIGNED NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    phone_number VARCHAR(10) NOT NULL UNIQUE,
    comfort_id INT UNSIGNED NOT NULL,
    CONSTRAINT check_price CHECK(price > 0),
    CONSTRAINT check_phone CHECK(phone_number regexp '^[+][0-9]{8}$')
);
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE room (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> number VARCHAR(10) NOT NULL UNIQUE,
    -> capacity TINYINT UNSIGNED NOT NULL,
    -> price DECIMAL(8, 2) NOT NULL,
    -> phone_number VARCHAR(10) NOT NULL,
    -> comfort_id INT UNSIGNED NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE room;
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| _id          | int unsigned     | NO   | PRI | NULL    | auto_increment |
| number       | varchar(10)      | NO   | UNI | NULL    |                |
| capacity     | tinyint unsigned | NO   |     | NULL    |                |
| price        | decimal(8,2)     | NO   |     | NULL    |                |
| phone_number | varchar(10)      | NO   |     | NULL    |                |
| comfort_id   | int unsigned     | NO   |     | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)
```

</details>

<details>
<summary><b>Клиенты</b></summary>

```
mysql> CREATE TABLE client (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    second_name VARCHAR(20) NOT NULL,
    passport_number CHAR(10) NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    address VARCHAR(100),
    comment TEXT,
    CONSTRAINT check_passport CHECK(passport_number regexp '^[+][0-9]{10}$')
);
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE client (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> last_name VARCHAR(20) NOT NULL,
    -> first_name VARCHAR(20) NOT NULL,
    -> second_name VARCHAR(20) NOT NULL,
    -> passport_number CHAR(10) NOT NULL,
    -> birth_date DATE NOT NULL,
    -> address VARCHAR(100),
    -> comment TEXT
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE client;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| _id             | int unsigned | NO   | PRI | NULL    | auto_increment |
| last_name       | varchar(20)  | NO   |     | NULL    |                |
| first_name      | varchar(20)  | NO   |     | NULL    |                |
| second_name     | varchar(20)  | NO   |     | NULL    |                |
| passport_number | char(10)     | NO   |     | NULL    |                |
| birth_date      | date         | NO   |     | NULL    |                |
| address         | varchar(100) | YES  |     | NULL    |                |
| comment         | text         | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)
```

</details>

<details>
<summary><b>Скидки</b></summary>

```
mysql> CREATE TABLE discount (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> category_name VARCHAR(30) NOT NULL,
    -> value DECIMAL(3,2) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW COLUMNS FROM discount;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| _id           | int unsigned | NO   | PRI | NULL    | auto_increment |
| category_name | varchar(30)  | NO   |     | NULL    |                |
| value         | decimal(3,2) | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)
```

</details>

<details>
<summary><b>Клиенты_Скидки</b></summary>

```
mysql> CREATE TABLE client_discount (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> client_id INT UNSIGNED NOT NULL,
    -> discount_id INT UNSIGNED NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE client_discount;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| _id         | int unsigned | NO   | PRI | NULL    | auto_increment |
| client_id   | int unsigned | NO   |     | NULL    |                |
| discount_id | int unsigned | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

```

</details>

<details>
<summary><b>Телефоны</b></summary>

```
mysql> CREATE TABLE phone (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number CHAR(12) NOT NULL UNIQUE CHECK(number regexp '^[+][0-9]{10}$'),
    client_id INT UNSIGNED NOT NULL
);
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE phone (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> number CHAR(10) NOT NULL,
    -> client_id INT UNSIGNED NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW COLUMNS FROM phone;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| _id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| number    | char(10)     | NO   |     | NULL    |                |
| client_id | int unsigned | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

```

</details>

<details>
<summary><b>Брони</b></summary>

```
mysql> CREATE TABLE reservation (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -> enter_date DATE NOT NULL,
    -> leave_date DATE NOT NULL,
    -> room_id INT UNSIGNED NOT NULL,
    -> client_id INT UNSIGNED NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> DESCRIBE reservation;
+------------+--------------+------+-----+-------------------+-------------------+
| Field      | Type         | Null | Key | Default           | Extra             |
+------------+--------------+------+-----+-------------------+-------------------+
| _id        | int unsigned | NO   | PRI | NULL              | auto_increment    |
| date_ts    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| enter_date | date         | NO   |     | NULL              |                   |
| leave_date | date         | NO   |     | NULL              |                   |
| room_id    | int unsigned | NO   |     | NULL              |                   |
| client_id  | int unsigned | NO   |     | NULL              |                   |
+------------+--------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

```

</details>

<details>
<summary><b>Поселения</b></summary>

```
mysql> CREATE TABLE checkin (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -> enter_date DATE NOT NULL,
    -> leave_date DATE NOT NULL,
    -> room_id INT UNSIGNED NOT NULL,
    -> client_id INT UNSIGNED NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW COLUMNS FROM checkin;
+------------+--------------+------+-----+-------------------+-------------------+
| Field      | Type         | Null | Key | Default           | Extra             |
+------------+--------------+------+-----+-------------------+-------------------+
| _id        | int unsigned | NO   | PRI | NULL              | auto_increment    |
| date_ts    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| enter_date | date         | NO   |     | NULL              |                   |
| leave_date | date         | NO   |     | NULL              |                   |
| room_id    | int unsigned | NO   |     | NULL              |                   |
| client_id  | int unsigned | NO   |     | NULL              |                   |
+------------+--------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

```

</details>

#### Проверка

Вывод списка таблиц.

```sql
mysql> SHOW TABLES;
+-----------------+
| Tables_in_hotel |
+-----------------+
| client          |
| client_discount |
| comfort         |
| discount        |
| phone           |
| reservation     |
| room            |
+-----------------+
7 rows in set (0.00 sec)
```

Проверка осуществляется выводом структур таблиц, вставкой пробных данных (валидных и невалидных) в созданные таблицы с выводом добавленных данных.

<details>
<summary><b>Комфортабельность</b></summary>

```
mysql> DESCRIBE comfort;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| _id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| type_name | varchar(30)  | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+

mysql> INSERT INTO comfort (type_name)
    VALUE ('Обычный');
Query OK, 0 rows affected (0.00 sec)


mysql> INSERT INTO comfort (type_name)
    VALUE (NULL);
ERROR 1048 (23000): Column 'type_name' cannot be null

mysql> INSERT INTO comfort (type_name)
    VALUE ('');
ERROR 3819 (HY000): Check constraint 'comfort_chk_1' is violated.

mysql> INSERT INTO comfort (type_name)
    VALUE ('Lorem ipsum dolor sit amet, consectetur adipiscing elit');
ERROR 1406 (22001): Data too long for column 'type_name' at row 1

mysql> select * from comfort;
+-----+-----------+
| _id | type_name |
+-----+-----------+
|   1 | Обычный   |
+-----+-----------+
1 row in set (0.00 sec)
```

</details>

### Итоговый алгоритм


## Работа 4.O. «Разработка серверной части базы данных в СУБД MysQL. Изменение структуры таблиц»

### Задание 4.1.2

#### Цель работы
- изучить основные положения теории баз данных, хранилищ данных, баз знаний;
- изучить методы описания схем баз данных в современных СУБД;
- сформировать умение создавать объекты баз данных в современных СУБД.

#### Условия задач
1) Cоздать таблицу с клиентами `clients (name varchar(20), age int, dolgnost vachar(15), dolgnost varchar(10))`.
2) Вставить в таблицу два поля `telephon char(11)` и `Name varchar(30)`.
3) Добавить уникальный индекс для поля `telephon` и простой индекс для поля `age`.
4) Изменить тип поля `dolgnost` на `char(12)` в таблице `client`.
5) Создать таблицу `ctrana(nazv_ctr varcar(10))`.
6) Добавить ключевое поле `id_cint` в таблицу `clients` и ключевое поле `id_c` в таблицу `ctrana`.
7) Добавить простой индекс для поля `age` и поставить его перед полем `name`.
8) Изменить имя и размер текстового поля `nazv_ctr` на `nazv_country varchar(20)` в таблице `ctrana`.
9) Переименовать поле `dolgnost` таблицы `clients` в post типа `varchar(15)`.
10) Добавить в таблицу `clients` внешний ключ `id_d` c `ON UPDATE RESTRICT`.
11) Удалить поле `dolgnost` из таблицы `clients`.
12) Переименовать таблицу `ctrana` в `country`.

#### Задача 1

Cоздать таблицу с клиентами `clients (name varchar(20), age int, dolgnost vachar(15), dolgnost varchar(10))`.


<details>
<summary><b>Создание и активация базы данных</b></summary>

```
mysql> CREATE DATABASE mytest;
Query OK, 1 row affected (0.00 sec)

mysql> USE mytest
Database changed
```

</details>

<details>
<summary><b>Создание таблицы с клиентами</b></summary>

```
mysql> CREATE TABLE clients (name varchar(20), age int, dolgnost vachar(15), dolgnost varchar(10));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'vachar(15), dolgnost varchar(10))' at line 1

mysql> CREATE TABLE clients (name VARCHAR(20), age INT, dolgnost VARCHAR(15));
Query OK, 0 rows affected (0.09 sec)

mysql> DESCRIBE clients;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | YES  |     | NULL    |       |
| age      | int         | YES  |     | NULL    |       |
| dolgnost | varchar(15) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)
```

</details>

#### Задача 2

<details>
<summary><b>Вставка полей</b></summary>

```
mysql> ALTER TABLE clients1 ADD COLUMN telephon char(11), ADD COLUMN Name varchar(30);
ERROR 1060 (42S21): Duplicate column name 'Name'

mysql> ALTER TABLE clients ADD COLUMN telephon char(11);
Query OK, 0 rows affected (0.01 sec)
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

</details>

#### Задача 3

<details>
<summary><b>Добавление индексов</b></summary>

```
mysql> ALTER TABLE clients
    -> ADD UNIQUE INDEX (telephon),
    -> ADD INDEX (age)
    -> ;
Query OK, 0 rows affected (0.00 sec)
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
```

</details>

#### Задача 4

<details>
<summary><b>Изменение типа поля</b></summary>

```
mysql> ALTER TABLE clients
    -> MODIFY dolgnost CHAR(12)
    -> ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE clients;
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

</details>

#### Задача 5

<details>
<summary><b>Создание таблицы `ctrana`</b></summary>

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

</details>

#### Задача 6

<details>
<summary><b>Добавление ключевых полей</b></summary>

```
mysql> ALTER TABLE clients
    -> ADD id_cint INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_cint  | int unsigned | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20)  | YES  |     | NULL    |                |
| age      | int          | YES  | MUL | NULL    |                |
| dolgnost | char(12)     | YES  |     | NULL    |                |
| telephon | char(11)     | YES  | UNI | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> ALTER TABLE ctrana
    -> ADD id_c INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
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

</details>

#### Задача 7

<details>
<summary><b>Добавление простого индекса</b></summary>

```
mysql> ALTER TABLE clients
    -> ADD INDEX (age),
    -> MODIFY COLUMN age INT AFTER id_cint
    -> ;
Query OK, 0 rows affected, 1 warning (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> DESCRIBE clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_cint  | int unsigned | NO   | PRI | NULL    | auto_increment |
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
| clients |          0 | PRIMARY  |            1 | id_cint     | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clients |          0 | telephon |            1 | telephon    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clients |          1 | age      |            1 | age         | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0.00 sec)
```

</details>

#### Задача 8

<details>
<summary><b>Изменение поля</b></summary>

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

</details>

#### Задача 9

<details>
<summary><b>Изменение поля</b></summary>

```
mysql> ALTER TABLE clients CHANGE COLUMN dolgnost post VARCHAR(15);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_cint  | int unsigned | NO   | PRI | NULL    | auto_increment |
| age      | int          | YES  | MUL | NULL    |                |
| name     | varchar(20)  | YES  |     | NULL    |                |
| post     | varchar(15)  | YES  |     | NULL    |                |
| telephon | char(11)     | YES  | UNI | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)
```

</details>

#### Задача 10

<details>
<summary><b>Добавление внешнего ключа</b></summary>

```
mysql> ALTER TABLE clients
    -> ADD id_d INT UNSIGNED,
    -> ADD FOREIGN KEY (id_d) REFERENCES ctrana (id_c) ON UPDATE RESTRICT
    -> ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE clients;
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table

                                                    |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| clients | CREATE TABLE `clients` (
  `id_cint` int unsigned NOT NULL AUTO_INCREMENT,
  `age` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `post` varchar(15) DEFAULT NULL,
  `telephon` char(11) DEFAULT NULL,
  `id_d` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_cint`),
  UNIQUE KEY `telephon` (`telephon`),
  KEY `age` (`age`),
  KEY `id_d` (`id_d`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_d`) REFERENCES `ctrana` (`id_c`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
```

</details>

#### Задача 11

<details>
<summary><b>Удаление поля</b></summary>

```
mysql> > ALTER TABLE clients DROP dolgnost;
ERROR 1091 (42000): Can't DROP 'dolgnost'; check that column/key exists
mysql> ALTER TABLE clients DROP post;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_cint  | int unsigned | NO   | PRI | NULL    | auto_increment |
| age      | int          | YES  | MUL | NULL    |                |
| name     | varchar(20)  | YES  |     | NULL    |                |
| telephon | char(11)     | YES  | UNI | NULL    |                |
| id_d     | int unsigned | YES  | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

```

</details>

#### Задача 12

<details>
<summary><b>Переименование таблицы</b></summary>

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

</details>

## Работа 5.O. «Разработка серверной части базы данных в СУБД  MySQL. Создание индексов (простых, уникальных)»

### Задание 5.1.2

#### Цель работы
- -	изучить cтруктуры данных СУБД, общий подход к организации представлений, таблиц, индексов и кластеров;
-	сформировать умение создавать объекты баз данных в современных СУБД.

#### Условия задач
1) Создать простые и уникальные индексы для своих таблиц (не менее пяти).

#### Задача 1

<details>
<summary><b>Создание уникального индекса для таблицы КОМФОРТАБЕЛЬНОСТЬ</b></summary>

```
mysql> CREATE UNIQUE INDEX type_name ON comfort (type_name);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE hotel;
ERROR 1146 (42S02): Table 'hotel.hotel' doesn't exist
mysql> DESCRIBE comfort;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| _id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| type_name | varchar(10)  | NO   | UNI | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE comfort;
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table
         |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| comfort | CREATE TABLE `comfort` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание уникального индекса для таблицы НОМЕРА</b></summary>

```
mysql> ALTER TABLE room ADD UNIQUE INDEX (phone_number);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE room;
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| _id          | int unsigned     | NO   | PRI | NULL    | auto_increment |
| number       | varchar(10)      | NO   | UNI | NULL    |                |
| capacity     | tinyint unsigned | NO   |     | NULL    |                |
| price        | decimal(8,2)     | NO   |     | NULL    |                |
| phone_number | varchar(10)      | NO   | UNI | NULL    |                |
| comfort_id   | int unsigned     | NO   |     | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE room;
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table
                                                                                                                                                                                               |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| room  | CREATE TABLE `room` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  `capacity` tinyint unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `comfort_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
```

</details>

<details>
<summary><b>Создание уникального и обычного индекса для таблицы КЛИЕНТЫ</b></summary>

```
mysql> ALTER TABLE client
    -> ADD INDEX (last_name),
    -> ADD UNIQUE INDEX (passport_number)
    -> ;
Query OK, 0 rows affected (0.01 sec)                                           
Records: 0  Duplicates: 0  Warnings: 0                                         
                                                                               
mysql> DESCRIBE client;                                                        
+-----------------+--------------+------+-----+---------+----------------+     
| Field           | Type         | Null | Key | Default | Extra          |     
+-----------------+--------------+------+-----+---------+----------------+     
| _id             | int unsigned | NO   | PRI | NULL    | auto_increment |     
| last_name       | varchar(20)  | NO   | MUL | NULL    |                |     
| first_name      | varchar(20)  | NO   |     | NULL    |                |     
| second_name     | varchar(20)  | NO   |     | NULL    |                |     
| passport_number | char(10)     | NO   | UNI | NULL    |                |     
| birth_date      | date         | NO   |     | NULL    |                |     
| address         | varchar(100) | YES  |     | NULL    |                |     
| comment         | text         | YES  |     | NULL    |                |     
+-----------------+--------------+------+-----+---------+----------------+     
8 rows in set (0.00 sec)                                                       
                                                                               
mysql> SHOW CREATE TABLE client;                                               
+--------+---------------------------------------------------------------------
-------------------------------------------------------------------------------
--------------+                                                                
| Table  | Create Table                                                        
                                                                               
              |                                                                
+--------+---------------------------------------------------------------------
-------------------------------------------------------------------------------
--------------+                                                                
| client | CREATE TABLE `client` (                                             
  `_id` int unsigned NOT NULL AUTO_INCREMENT,                                  
  `last_name` varchar(20) NOT NULL,                                            
  `first_name` varchar(20) NOT NULL,                                           
  `second_name` varchar(20) NOT NULL,                                          
  `passport_number` char(10) NOT NULL,                                         
  `birth_date` date NOT NULL,                                                  
  `address` varchar(100) DEFAULT NULL,                                         
  `comment` text,                                                              
  PRIMARY KEY (`_id`),                                                         
  UNIQUE KEY `passport_number` (`passport_number`),                            
  KEY `last_name` (`last_name`)                                                
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |           
+--------+---------------------------------------------------------------------
-------------------------------------------------------------------------------
--------------+                                                                
1 row in set (0.00 sec)                                                        
```

</details>

<details>
<summary><b>Создание уникального индекса для таблицы СКИДКИ</b></summary>

```
mysql> ALTER TABLE discount ADD UNIQUE INDEX (category_name);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM discount;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| _id           | int unsigned | NO   | PRI | NULL    | auto_increment |
| category_name | varchar(30)  | NO   | UNI | NULL    |                |
| value         | decimal(3,2) | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE discount;
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table
                                                        |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| discount | CREATE TABLE `discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `value` decimal(3,2) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание уникального индекса для таблицы ТЕЛЕФОНЫ</b></summary>

```
mysql> CREATE UNIQUE INDEX phone_number ON phone(number);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE phone;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| _id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| number    | char(10)     | NO   | UNI | NULL    |                |
| client_id | int unsigned | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE phone;
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table
                                    |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `phone_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание простых индексов для таблицы БРОНИ</b></summary>

```
mysql> CREATE INDEX enter_date ON reservation (enter_date DESC);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX leave_date ON reservation (leave_date DESC);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE reservation;
+------------+--------------+------+-----+-------------------+-------------------+
| Field      | Type         | Null | Key | Default           | Extra             |
+------------+--------------+------+-----+-------------------+-------------------+
| _id        | int unsigned | NO   | PRI | NULL              | auto_increment    |
| date_ts    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| enter_date | date         | NO   | MUL | NULL              |                   |
| leave_date | date         | NO   | MUL | NULL              |                   |
| room_id    | int unsigned | NO   |     | NULL              |                   |
| client_id  | int unsigned | NO   |     | NULL              |                   |
+------------+--------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

mysql> SHOW INDEXES FROM reservation;
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table       | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| reservation |          0 | PRIMARY    |            1 | _id         | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| reservation |          1 | enter_date |            1 | enter_date  | D         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| reservation |          1 | leave_date |            1 | leave_date  | D         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE reservation;
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table       | Create Table
                                                                                                                                                                                                                   |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| reservation | CREATE TABLE `reservation` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `enter_date` (`enter_date` DESC),
  KEY `leave_date` (`leave_date` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание простых индексов для таблицы ПОСЕЛЕНИЯ</b></summary>

```
mysql> ALTER TABLE  checkin
    -> ADD INDEX (enter_date DESC),
    -> ADD INDEX (leave_date DESC)
    -> ;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM checkin;
+------------+--------------+------+-----+-------------------+-------------------+
| Field      | Type         | Null | Key | Default           | Extra             |
+------------+--------------+------+-----+-------------------+-------------------+
| _id        | int unsigned | NO   | PRI | NULL              | auto_increment    |
| date_ts    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| enter_date | date         | NO   | MUL | NULL              |                   |
| leave_date | date         | NO   | MUL | NULL              |                   |
| room_id    | int unsigned | NO   |     | NULL              |                   |
| client_id  | int unsigned | NO   |     | NULL              |                   |
+------------+--------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

mysql> SHOW INDEX FROM checkin;
+---------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| checkin |          0 | PRIMARY    |            1 | _id         | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| checkin |          1 | enter_date |            1 | enter_date  | D         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| checkin |          1 | leave_date |            1 | leave_date  | D         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0.00 sec)


mysql> SHOW CREATE TABLE checkin;
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table
                                                                                                                                                                                                           |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checkin | CREATE TABLE `checkin` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `enter_date` (`enter_date` DESC),
  KEY `leave_date` (`leave_date` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

## Работа 6.O. «Разработка серверной части базы данных в СУБД  MySQL. Установка ограничений и контроль ссылочной целостности»

### Задание 5.1.2

#### Цель работы
- изучить методы организации целостности данных;
- сформировать умение создавать объекты баз данных в современных СУБД.

#### Условия задач
В соответствии со своей предметной областью создать:
1)	Ограничения на уникальные индексы при создании таблиц.
2)	Ограничение на поля;
3)	Ограничение на внешние ключи;
4)	Удалить ограничения.

#### Задача 1

<details>
<summary><b>Установка ограничения на уникальные индексы</b></summary>

```
mysql> ALTER TABLE room ADD UNIQUE INDEX (phone_number);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE hotel;
ERROR 1146 (42S02): Table 'hotel.hotel' doesn't exist
mysql> DESCRIBE comfort;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| _id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| type_name | varchar(10)  | NO   | UNI | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE comfort;
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table
         |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| comfort | CREATE TABLE `comfort` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>


<details>
<summary><b>Создание ограничения на уникальные индексы при создании таблицы КОМФОРТАБЕЛЬНОСТЬ</b></summary>

```
mysql> CREATE TABLE comfort (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> type_name VARCHAR(10) NOT NULL,
    -> CONSTRAINT comfort_name_uq UNIQUE(type_name)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW CREATE TABLE comfort;
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table
               |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| comfort | CREATE TABLE `comfort` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `comfort_name_uq` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Команда добавления ограничения уникальности</b></summary>

```
mysql> ALTER TABLE discount ADD CONSTRAINT UNIQUE (category_name);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> SHOW COLUMNS FROM discount;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| _id           | int unsigned | NO   | PRI | NULL    | auto_increment |
| category_name | varchar(30)  | NO   | UNI | NULL    |                |
| value         | decimal(3,2) | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE discount;
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table
                                                        |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| discount | CREATE TABLE `discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `value` decimal(3,2) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничения на уникальные индексы при создании таблицы СКИДКИ</b></summary>

```
mysql> CREATE TABLE discount (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> category_name VARCHAR(30) NOT NULL,
    -> value DECIMAL(3,2) NOT NULL,
    -> CONSTRAINT discount_category_uq UNIQUE(category_name)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW CREATE TABLE discount;
+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table
                                                               |
+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| discount | CREATE TABLE `discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `value` decimal(3,2) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `discount_category_uq` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Добавление уникального индекса для таблицы ТЕЛЕФОНЫ</b></summary>

```
mysql> ALTER TABLE phone ADD UNIQUE KEY phone_number (number);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE phone;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| _id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| number    | char(10)     | NO   | UNI | NULL    |                |
| client_id | int unsigned | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE phone;
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table
                                    |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `phone_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>


<details>
<summary><b>Создание ограничения на уникальные индексы при создании таблицы ТЕЛЕФОНЫ</b></summary>

```
mysql> CREATE TABLE phone (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> number CHAR(10) NOT NULL,
    -> client_id INT UNSIGNED NOT NULL,
    -> CONSTRAINT phone_number_uq UNIQUE(number)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW CREATE TABLE phone;
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table
                                       |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `phone_number_uq` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

ALTER TABLE `table_name`
    ADD UNIQUE KEY `index_name` (`column_name`);

ALTER TABLE table_name ADD CONSTRAINT index_name UNIQUE (column_name)

ALTER TABLE test_table MODIFY COLUMN id INT NOT NULL UNIQUE;

#### Задача 2

<details>
<summary><b>Установка ограничений на поля таблицы КОМФОРТАБЕЛЬНОСТЬ</b></summary>

```
mysql> ALTER TABLE comfort ADD CONSTRAINT comfort_not_empty CHECK(type_name <> '');
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE comfort;
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table
                                                                             |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| comfort | CREATE TABLE `comfort` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `type_name` (`type_name`),
  CONSTRAINT `comfort_not_empty` CHECK ((`type_name` <> _cp866''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничений на поля при создании таблицы КОМФОРТАБЕЛЬНОСТЬ</b></summary>

```
mysql> CREATE TABLE comfort (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> type_name VARCHAR(10) NOT NULL UNIQUE,
    -> CONSTRAINT comfort_name_ne_chk CHECK(type_name <> ''));
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW CREATE TABLE comfort;
+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table
                                                                               |
+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| comfort | CREATE TABLE `comfort` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `type_name` (`type_name`),
  CONSTRAINT `comfort_name_ne_chk` CHECK ((`type_name` <> _cp866''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений на поля таблицы НОМЕРА</b></summary>

```
mysql> ALTER TABLE room
    -> ADD CONSTRAINT number_not_empty CHECK(number != ''),
    -> ADD CONSTRAINT capacity_range CHECK(capacity > 0 AND capacity < 20),
    -> ADD CONSTRAINT price_range CHECK(price>0),
    -> ADD CONSTRAINT phone_format CHECK(phone_number REGEXP '^[0-9]{1,10}$')
    -> ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE room;
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table


               |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| room  | CREATE TABLE `room` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  `capacity` tinyint unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `comfort_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `phone_number` (`phone_number`),
  CONSTRAINT `capacity_range` CHECK (((`capacity` > 0) and (`capacity` < 20))),
  CONSTRAINT `number_not_empty` CHECK ((`number` <> _utf8mb4'')),
  CONSTRAINT `phone_format` CHECK (regexp_like(`phone_number`,_utf8mb4'^[0-9]{1,10}$')),
  CONSTRAINT `price_range` CHECK ((`price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений на поля таблицы КЛИЕНТЫ</b></summary>

```
mysql> ALTER TABLE client
    -> ADD CONSTRAINT name_not_empty CHECK(last_name <> '' AND first_name <> ''),
    -> ADD CONSTRAINT passport_format CHECK(passport_number REGEXP '^[0-9]{10}$'),
    -> ADD CONSTRAINT age_range CHECK(birth_date > '1904-01-01')
    -> ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE client;
+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table

                                                                                                                                                                                                  |
+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| client | CREATE TABLE `client` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `second_name` varchar(20) NOT NULL,
  `passport_number` char(10) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `passport_number` (`passport_number`),
  KEY `last_name` (`last_name`),
  CONSTRAINT `age_range` CHECK ((`birth_date` > _cp866'1904-01-01')),
  CONSTRAINT `name_not_empty` CHECK (((`last_name` <> _cp866'') and (`first_name` <> _cp866''))),
  CONSTRAINT `passport_format` CHECK (regexp_like(`passport_number`,_cp866'^[0-9]{1,10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничений на поля при создании таблицы КЛИЕНТЫ</b></summary>

```
mysql> CREATE TABLE client (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> last_name VARCHAR(20) NOT NULL,
    -> first_name VARCHAR(20) NOT NULL,
    -> second_name VARCHAR(20) NOT NULL,
    -> passport_number CHAR(10) NOT NULL UNIQUE,
    -> birth_date DATE NOT NULL,
    -> address VARCHAR(100),
    -> comment TEXT,
    -> CONSTRAINT client_name_ne CHECK(last_name != '' AND first_name != ''),
    -> CONSTRAINT client_passport_ft CHECK(passport_number REGEXP '^[0-9]{10}$'),
    -> CONSTRAINT client_birth_rg CHECK(birth_date > '1904-01-01')
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> SHOW CREATE TABLE client;
+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table


          |
+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| client | CREATE TABLE `client` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `second_name` varchar(20) NOT NULL,
  `passport_number` char(10) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `passport_number` (`passport_number`),
  CONSTRAINT `client_birth_rg` CHECK ((`birth_date` > _cp866'1904-01-01')),
  CONSTRAINT `client_name_ne` CHECK (((`last_name` <> _cp866'') and (`first_name` <> _cp866''))),
  CONSTRAINT `client_passport_ft` CHECK (regexp_like(`passport_number`,_cp866'^[0-9]{10}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений на поля таблицы СКИДКИ</b></summary>

```
mysql> ALTER TABLE discount
    -> ADD CONSTRAINT category_not_empty CHECK(category_name != ''),
    -> ADD CONSTRAINT discount_value CHECK(value > 0)
    -> ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE discount;
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table
                                                                                                                                                                                      |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| discount | CREATE TABLE `discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `value` decimal(3,2) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `category_name` (`category_name`),
  CONSTRAINT `category_not_empty` CHECK ((`category_name` <> _cp866'')),
  CONSTRAINT `discount_value` CHECK ((`value` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```
</details>

<details>
<summary><b>Создание ограничений на поля при создании таблицы СКИДКИ</b></summary>

```
mysql> CREATE TABLE discount (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> category_name VARCHAR(30) NOT NULL UNIQUE,
    -> value DECIMAL(3,2) NOT NULL,
    -> CONSTRAINT discount_category_ne CHECK(category_name <> ''),
    -> CONSTRAINT discount_value_rg CHECK(value > 0)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW CREATE TABLE discount;
+----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table
                                                                                                                                                                                           |
+----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| discount | CREATE TABLE `discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `value` decimal(3,2) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `category_name` (`category_name`),
  CONSTRAINT `discount_category_ne` CHECK ((`category_name` <> _cp866'')),
  CONSTRAINT `discount_value_rg` CHECK ((`value` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

</details>

<details>
<summary><b>Установка ограничений на поля таблицы ТЕЛЕФОНЫ</b></summary>

```
mysql> ALTER TABLE phone ADD CONSTRAINT phone_number CHECK(number REGEXP '^[0-9]{10}$');
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE phone;
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table
                                                                                                                   |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `phone_number` (`number`),
  CONSTRAINT `phone_number` CHECK (regexp_like(`number`,_cp866'^[0-9]{10}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)


```

</details>

<details>
<summary><b>Установка ограничений на поля таблицы БРОНИ</b></summary>

```
mysql> ALTER TABLE reservation
    -> ADD CONSTRAINT reservation_ts CHECK (date_ts > '2020-01-01 00:00:00'),
    -> ADD CONSTRAINT reservation_date CHECK(enter_date > '2020-01-01' && leave_date > enter_date)
    -> ;
Query OK, 0 rows affected, 1 warning (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> SHOW CREATE TABLE reservation;
+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table       | Create Table

                                                                                                                                                                      |
+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| reservation | CREATE TABLE `reservation` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `enter_date` (`enter_date` DESC),
  KEY `leave_date` (`leave_date` DESC),
  CONSTRAINT `reservation_date` CHECK (((`enter_date` > _cp866'2020-01-01') and (`leave_date` > `enter_date`))),
  CONSTRAINT `reservation_ts` CHECK ((`date_ts` > _cp866'2020-01-01 00:00:00'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>
<details>
<summary><b>Установка ограничений на поля таблицы ТЕЛЕФОНЫ</b></summary>

```
mysql> ALTER TABLE phone ADD CONSTRAINT phone_number CHECK(number REGEXP '^[0-9]{10}$');
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE phone;
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table
                                                                                                                   |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `phone_number` (`number`),
  CONSTRAINT `phone_number` CHECK (regexp_like(`number`,_cp866'^[0-9]{10}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений на поля таблицы ПОСЕЛЕНИЯ</b></summary>

```
mysql> ALTER TABLE checkin
    -> ADD CONSTRAINT checkin_ts CHECK (date_ts > '2020-01-01 00:00:00'),
    -> ADD CONSTRAINT checkin_date CHECK(enter_date > '2020-01-01' && leave_date > enter_date)
    -> ;
Query OK, 0 rows affected, 1 warning (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> SHOW CREATE TABLE checkin;
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table

                                                                                                                                                      |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checkin | CREATE TABLE `checkin` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `enter_date` (`enter_date` DESC),
  KEY `leave_date` (`leave_date` DESC),
  CONSTRAINT `checkin_date` CHECK (((`enter_date` > _cp866'2020-01-01') and (`leave_date` > `enter_date`))),
  CONSTRAINT `checkin_ts` CHECK ((`date_ts` > _cp866'2020-01-01 00:00:00'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

#### Задача 3

<details>
<summary><b>Установка ограничений внешнего ключа для таблицы НОМЕРА</b></summary>

```
mysql> ALTER TABLE room
    -> ADD CONSTRAINT room_comfort_fk
    -> FOREIGN KEY(comfort_id) REFERENCES comfort(_id) ON DELETE CASCADE
    -> ;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS IN room;
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| _id          | int unsigned     | NO   | PRI | NULL    | auto_increment |
| number       | varchar(10)      | NO   | UNI | NULL    |                |
| capacity     | tinyint unsigned | NO   |     | NULL    |                |
| price        | decimal(8,2)     | NO   |     | NULL    |                |
| phone_number | varchar(10)      | NO   | UNI | NULL    |                |
| comfort_id   | int unsigned     | NO   | MUL | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE room;
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table


                                                                                                                                                |
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| room  | CREATE TABLE `room` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  `capacity` tinyint unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `comfort_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `room_comfort_fk` (`comfort_id`),
  CONSTRAINT `room_comfort_fk` FOREIGN KEY (`comfort_id`) REFERENCES `comfort` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `capacity_range` CHECK (((`capacity` > 0) and (`capacity` < 20))),
  CONSTRAINT `number_not_empty` CHECK ((`number` <> _utf8mb4'')),
  CONSTRAINT `phone_format` CHECK (regexp_like(`phone_number`,_utf8mb4'^[0-9]{1,10}$')),
  CONSTRAINT `price_range` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничений на внешние ключи при создании таблицы НОМЕРА</b></summary>

```
mysql> CREATE TABLE room (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> number VARCHAR(10) NOT NULL,
    -> capacity TINYINT UNSIGNED NOT NULL,
    -> price DECIMAL(8, 2) NOT NULL,
    -> phone_number VARCHAR(10) NOT NULL,
    -> comfort_id INT UNSIGNED NOT NULL,
    -> CONSTRAINT room_number_uq UNIQUE(number),
    -> CONSTRAINT room_number_ne CHECK(number <> ''),
    -> CONSTRAINT room_capacity_rg CHECK(capacity > 0 AND capacity < 20),
    -> CONSTRAINT room_price_rg CHECK(price > 0),
    -> CONSTRAINT room_phone_uq UNIQUE(phone_number),
    -> CONSTRAINT room_phone_pt CHECK(phone_number REGEXP '^[0-9]{1,10}$'),
    -> CONSTRAINT room_comfort_fk FOREIGN KEY (comfort_id) REFERENCES comfort(_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> SHOW CREATE TABLE room;
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table


                                                                                                                                                        |
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| room  | CREATE TABLE `room` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  `capacity` tinyint unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `comfort_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `room_number_uq` (`number`),
  UNIQUE KEY `room_phone_uq` (`phone_number`),
  KEY `room_comfort_fk` (`comfort_id`),
  CONSTRAINT `room_comfort_fk` FOREIGN KEY (`comfort_id`) REFERENCES `comfort` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `room_capacity_rg` CHECK (((`capacity` > 0) and (`capacity` < 20))),
  CONSTRAINT `room_number_ne` CHECK ((`number` <> _cp866'')),
  CONSTRAINT `room_phone_pt` CHECK (regexp_like(`phone_number`,_cp866'^[0-9]{1,10}$')),
  CONSTRAINT `room_price_rg` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений внешнего ключа для таблицы КЛИЕНТЫ_СКИДКИ</b></summary>

```
mysql> ALTER TABLE client_discount
    -> ADD FOREIGN KEY(client_id) REFERENCES client(_id) ON DELETE CASCADE,
    -> ADD FOREIGN KEY(discount_id) REFERENCES discount(_id) ON DELETE CASCADE
    -> ;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE client_discount;
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table           | Create Table

                                                                                  |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| client_discount | CREATE TABLE `client_discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `discount_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `client_id` (`client_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `client_discount_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `client_discount_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничений на внешние ключи при создании таблицы КЛИЕНТЫ_СКИДКИ</b></summary>

```
mysql> CREATE TABLE client_discount (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> client_id INT UNSIGNED NOT NULL,
    -> discount_id INT UNSIGNED NOT NULL,
    -> CONSTRAINT cd_client_fk FOREIGN KEY(client_id) REFERENCES client(_id) ON DELETE CASCADE,
    -> CONSTRAINT cd_discount_fk FOREIGN KEY(discount_id) REFERENCES discount(_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW CREATE TABLE client_discount;
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table           | Create Table

                                                                      |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| client_discount | CREATE TABLE `client_discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `discount_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `cd_client_fk` (`client_id`),
  KEY `cd_discount_fk` (`discount_id`),
  CONSTRAINT `cd_client_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `cd_discount_fk` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений внешнего ключа для таблицы КЛИЕНТЫ_СКИДКИ</b></summary>

```
mysql> ALTER TABLE phone
    -> ADD CONSTRAINT phone_client_fk
    -> FOREIGN KEY(client_id) REFERENCES client(_id) ON DELETE CASCADE
    -> ;
Query OK, 1 row affected (0.11 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE phone;
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table

                                      |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `phone_number` (`number`),
  KEY `phone_client_fk` (`client_id`),
  CONSTRAINT `phone_client_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `phone_number` CHECK (regexp_like(`number`,_utf8mb4'^[0-9]{10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничений на внешние ключи при создании таблицы ТЕЛЕФОНЫ</b></summary>

```
mysql> CREATE TABLE phone (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> number CHAR(10) NOT NULL,
    -> client_id INT UNSIGNED NOT NULL,
    -> CONSTRAINT phone_number_uq UNIQUE(number),
    -> CONSTRAINT phone_number_pt CHECK(number REGEXP '^[0-9]{10}$'),
    -> CONSTRAINT phone_client_fk FOREIGN KEY(client_id) REFERENCES client(_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW CREATE TABLE phone;
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table

                         |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `phone_number_uq` (`number`),
  KEY `phone_client_fk` (`client_id`),
  CONSTRAINT `phone_client_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `phone_number_pt` CHECK (regexp_like(`number`,_cp866'^[0-9]{10}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений внешнего ключа для таблицы БРОНИ</b></summary>

```
mysql> ALTER TABLE reservation
    -> ADD FOREIGN KEY(client_id) REFERENCES client(_id) ON DELETE CASCADE,
    -> ADD FOREIGN KEY(room_id) REFERENCES room(_id) ON DELETE CASCADE
    -> ;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE reservation;
+------------+--------------+------+-----+-------------------+-------------------+
| Field      | Type         | Null | Key | Default           | Extra             |
+------------+--------------+------+-----+-------------------+-------------------+
| _id        | int unsigned | NO   | PRI | NULL              | auto_increment    |
| date_ts    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| enter_date | date         | NO   | MUL | NULL              |                   |
| leave_date | date         | NO   | MUL | NULL              |                   |
| room_id    | int unsigned | NO   | MUL | NULL              |                   |
| client_id  | int unsigned | NO   | MUL | NULL              |                   |
+------------+--------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE reservation;
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table       | Create Table


                                                                                                                                                                                                       |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| reservation | CREATE TABLE `reservation` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `enter_date` (`enter_date` DESC),
  KEY `leave_date` (`leave_date` DESC),
  KEY `client_id` (`client_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_date` CHECK (((`enter_date` > _cp866'2020-01-01') and (`leave_date` > `enter_date`))),
  CONSTRAINT `reservation_ts` CHECK ((`date_ts` > _cp866'2020-01-01 00:00:00'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничений на внешние ключи при создании таблицы БРОНИ</b></summary>

```
mysql> CREATE TABLE reservation (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -> enter_date DATE NOT NULL,
    -> leave_date DATE NOT NULL,
    -> room_id INT UNSIGNED NOT NULL,
    -> client_id INT UNSIGNED NOT NULL,
    -> CONSTRAINT reservation_ts_rg CHECK(date_ts > '2020-01-01 00:00:00'),
    -> CONSTRAINT reservation_date_chk CHECK(enter_date > '2020-01-01' && leave_date > enter_date),
    -> CONSTRAINT reservation_room_fk FOREIGN KEY(room_id) REFERENCES room(_id) ON DELETE CASCADE,
    -> CONSTRAINT reservation_client_fk FOREIGN KEY(client_id) REFERENCES client(_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected, 1 warning (0.10 sec)

mysql> SHOW CREATE TABLE reservation;
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table       | Create Table


                                                                                                                                                          |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| reservation | CREATE TABLE `reservation` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `reservation_room_fk` (`room_id`),
  KEY `reservation_client_fk` (`client_id`),
  CONSTRAINT `reservation_client_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_room_fk` FOREIGN KEY (`room_id`) REFERENCES `room` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_date_chk` CHECK (((`enter_date` > _cp866'2020-01-01') and (`leave_date` > `enter_date`))),
  CONSTRAINT `reservation_ts_rg` CHECK ((`date_ts` > _cp866'2020-01-01 00:00:00'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Установка ограничений внешнего ключа для таблицы ПОСЕЛЕНИЯ</b></summary>

```
mysql> ALTER TABLE checkin
    -> ADD CONSTRAINT checkin_client_fk FOREIGN KEY(client_id)
    -> REFERENCES client(_id) ON DELETE CASCADE,
    -> ADD CONSTRAINT checkin_room_fk FOREIGN KEY(room_id)
    -> REFERENCES room(_id) ON DELETE CASCADE
    -> ;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM checkin;
+------------+--------------+------+-----+-------------------+-------------------+
| Field      | Type         | Null | Key | Default           | Extra             |
+------------+--------------+------+-----+-------------------+-------------------+
| _id        | int unsigned | NO   | PRI | NULL              | auto_increment    |
| date_ts    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| enter_date | date         | NO   | MUL | NULL              |                   |
| leave_date | date         | NO   | MUL | NULL              |                   |
| room_id    | int unsigned | NO   | MUL | NULL              |                   |
| client_id  | int unsigned | NO   | MUL | NULL              |                   |
+------------+--------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

mysql> SHOW CREATE TABLE checkin;
+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table


                                                                                                                                                                                                   |
+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checkin | CREATE TABLE `checkin` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `enter_date` (`enter_date` DESC),
  KEY `leave_date` (`leave_date` DESC),
  KEY `checkin_client_fk` (`client_id`),
  KEY `checkin_room_fk` (`room_id`),
  CONSTRAINT `checkin_client_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `checkin_room_fk` FOREIGN KEY (`room_id`) REFERENCES `room` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `checkin_date` CHECK (((`enter_date` > _cp866'2020-01-01') and (`leave_date` > `enter_date`))),
  CONSTRAINT `checkin_ts` CHECK ((`date_ts` > _cp866'2020-01-01 00:00:00'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Создание ограничений на внешние ключи при создании таблицы БРОНИ</b></summary>

```
mysql> CREATE TABLE checkin (
    -> _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -> enter_date DATE NOT NULL,
    -> leave_date DATE NOT NULL,
    -> room_id INT UNSIGNED NOT NULL,
    -> client_id INT UNSIGNED NOT NULL,
    -> CONSTRAINT checkin_ts_rg CHECK(date_ts > '2020-01-01 00:00:00'),
    -> CONSTRAINT checkin_date_chk CHECK(enter_date > '2020-01-01' && leave_date > enter_date),
    -> CONSTRAINT checkin_room_fk FOREIGN KEY(room_id) REFERENCES room(_id) ON DELETE CASCADE,
    -> CONSTRAINT checkin_client_fk FOREIGN KEY(client_id) REFERENCES client(_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected, 1 warning (0.10 sec)

mysql> SHOW CREATE TABLE checkin;
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table


                                                                                                                          |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checkin | CREATE TABLE `checkin` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `checkin_room_fk` (`room_id`),
  KEY `checkin_client_fk` (`client_id`),
  CONSTRAINT `checkin_client_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `checkin_room_fk` FOREIGN KEY (`room_id`) REFERENCES `room` (`_id`) ON DELETE CASCADE,
  CONSTRAINT `checkin_date_chk` CHECK (((`enter_date` > _cp866'2020-01-01') and (`leave_date` > `enter_date`))),
  CONSTRAINT `checkin_ts_rg` CHECK ((`date_ts` > _cp866'2020-01-01 00:00:00'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>


#### Задача 4

<details>
<summary><b>Удаление ограничений для таблицы КОМФОРТ</b></summary>

```
mysql> ALTER TABLE comfort
    -> DROP CONSTRAINT comfort_name_ne_chk,
    -> DROP INDEX type_name
    -> ;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE comfort;
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                                                                        |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| comfort | CREATE TABLE `comfort` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Удаление ограничений для таблицы НОМЕРА</b></summary>

```
mysql> ALTER TABLE room
    -> DROP CONSTRAINT room_comfort_fk,
    -> DROP CONSTRAINT room_capacity_rg,
    -> DROP CONSTRAINT room_number_ne,
    -> DROP CONSTRAINT room_phone_pt,
    -> DROP CONSTRAINT room_price_rg,
    -> DROP INDEX room_number_uq,
    -> DROP INDEX room_phone_uq,
    -> DROP INDEX room_comfort_fk
    -> ;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE room;
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table
                                                                                                               |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| room  | CREATE TABLE `room` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  `capacity` tinyint unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `comfort_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Удаление ограничений для таблицы КЛИЕНТЫ</b></summary>

```
mysql> ALTER TABLE client
    -> DROP CONSTRAINT client_birth_rg,
    -> DROP CONSTRAINT client_name_ne,
    -> DROP CONSTRAINT client_passport_ft,
    -> DROP INDEX passport_number
    -> ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE client;
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table
                                                                                                                                                                        |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| client | CREATE TABLE `client` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `second_name` varchar(20) NOT NULL,
  `passport_number` char(10) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Удаление ограничений для таблицы СКИДКИ</b></summary>

```
mysql> ALTER TABLE discount
    -> DROP CONSTRAINT discount_category_ne,
    -> DROP CONSTRAINT discount_value_rg,
    -> DROP INDEX discount_category_uq
    -> ;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE discount;
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table
        |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| discount | CREATE TABLE `discount` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `value` decimal(3,2) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Удаление ограничений для таблицы ТЕЛЕФОНЫ</b></summary>

```
mysql> ALTER TABLE phone
    -> DROP CONSTRAINT phone_client_fk,
    -> DROP CONSTRAINT phone_number_pt,
    -> DROP INDEX phone_number_uq,
    -> DROP INDEX phone_client_fk
    -> ;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE phone;
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                     |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| phone | CREATE TABLE `phone` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` char(10) NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Удаление ограничений для таблицы БРОНИ</b></summary>

```
mysql> ALTER TABLE reservation
    -> DROP CONSTRAINT reservation_client_fk,
    -> DROP CONSTRAINT reservation_room_fk,
    -> DROP CONSTRAINT reservation_date_chk,
    -> DROP CONSTRAINT reservation_ts_rg,
    -> DROP INDEX reservation_client_fk,
    -> DROP INDEX reservation_room_fk
    -> ;
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE reservation;
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table       | Create Table
                                                                                                                                   |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| reservation | CREATE TABLE `reservation` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>

<details>
<summary><b>Удаление ограничений для таблицы ПОСЕЛЕНИЯ</b></summary>

```
mysql> ALTER TABLE checkin
    -> DROP CONSTRAINT checkin_client_fk,
    -> DROP CONSTRAINT checkin_room_fk,
    -> DROP CONSTRAINT checkin_date_chk,
    -> DROP CONSTRAINT checkin_ts_rg,
    -> DROP INDEX checkin_client_fk,
    -> DROP INDEX checkin_room_fk
    -> ;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW CREATE TABLE checkin;
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table
                                                                                                                           |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checkin | CREATE TABLE `checkin` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enter_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `room_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

```

</details>
