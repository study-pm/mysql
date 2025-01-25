/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных — «Туристический спорт». */

/* Атрибуты для хранения в базе данных:*/
-- ФИО туриста,
-- дата рождения,
-- с какого года увлекается туризмом,
-- ФИО тренера,
-- пол,
-- телефон,
-- название вида туристического спорта (скалолазание, водный, пешие, конный),
-- категория сложности (средняя, высшая),
-- оплата в клубе,
-- месяц оплаты.

-- Создание базы данных
CREATE DATABASE IF NOT EXISTS tourist_sports;

-- Установка базы данных
USE tourist_sports;

-- Классификатор видов спорта
CREATE TABLE IF NOT EXISTS sport (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63)
);

-- Справочник тренеров
CREATE TABLE IF NOT EXISTS coach(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(127) NOT NULL
);

-- Таблица туристов
CREATE TABLE tourist(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL,
    birth_date DATE NOT NULL,
    start_year YEAR NOT NULL,
    gender ENUM('f', 'm') NOT NULL,
    phone_number CHAR(10) CHECK (phone_number REGEXP '^[0-9]{10}$'),
    category ENUM('высшая', 'средняя') NOT NULL,
    rate DOUBLE(10, 2) NOT NULL CHECK (rate > 0),
    coach_id INT UNSIGNED NOT NULL,
    sport_id INT UNSIGNED NOT NULL,
    CHECK (birth_date > DATE_SUB(create_ts, INTERVAL 120 YEAR) AND birth_date < DATE_ADD(create_ts, INTERVAL 10 YEAR)),
    CHECK (start_year > YEAR(birth_date) AND start_year <= YEAR(create_ts)),
    FOREIGN KEY (coach_id) REFERENCES coach(id),
    FOREIGN KEY (sport_id) REFERENCES sport(id)
);

-- Таблица оплат
CREATE TABLE payment (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    payment_month DATE NOT NULL CHECK (DAY(payment_month) = 1),
    amount DOUBLE(10,2) NOT NULL,
    tourist_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (tourist_id) REFERENCES tourist(id) ON DELETE CASCADE,
);
