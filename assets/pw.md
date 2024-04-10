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
    type_name VARCHAR(30) NOT NULL
);
Query OK, 0 rows affected (0.01 sec)
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
    CONSTRAINT check_phone CHECK(phone_number regexp '^[+][0-9]{8}$')
);
Query OK, 0 rows affected (0.01 sec)
```

</details>

<details>
<summary><b>Клиенты</b></summary>

```
mysql> CREATE TABLE client (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    second_name VARCHAR(30) NOT NULL,
    passport_number CHAR(12) NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    address VARCHAR(100),
    comment TEXT,
    CONSTRAINT check_passport CHECK(passport_number regexp '^[+][0-9]{10}$')
);
Query OK, 0 rows affected (0.01 sec)
```

</details>

<details>
<summary><b>Скидки</b></summary>

```
mysql> CREATE TABLE discount (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL,
    value DECIMAL(3,2) NOT NULL
);
Query OK, 0 rows affected (0.01 sec)
```

</details>

<details>
<summary><b>Клиенты_Скидки</b></summary>

```
mysql> CREATE TABLE client_discount (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    client_id INT UNSIGNED NOT NULL,
    discount_id INT UNSIGNED NOT NULL
);
Query OK, 0 rows affected (0.01 sec)
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
```

</details>

<details>
<summary><b>Брони</b></summary>

```
mysql> CREATE TABLE reservation (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    enter_date DATE NOT NULL,
    leave_date DATE NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL
);
Query OK, 0 rows affected (0.01 sec)
```

</details>

<details>
<summary><b>Поселения</b></summary>

```
mysql> CREATE TABLE checkin (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    enter_date DATE NOT NULL,
    leave_date DATE NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL
);
Query OK, 0 rows affected (0.01 sec)
```

</details>

### Итоговый алгоритм
