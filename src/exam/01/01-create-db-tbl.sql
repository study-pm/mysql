/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Шахматные турниры». */

/* Атрибуты для хранения в базе данных: */
-- ФИО шахматиста,
-- возраст,
-- пол,
-- город проживания,
-- название турниров,
-- в которых принимал участие шахматист,
-- звание шахматиста (чемпиона мира по шахматам, кмс, мастер спорта, 1 разряд, 2разряд, чемпион РФ),
-- город проведения турнира,
-- вознаграждение (руб.),
-- год проведения турнира.

-- Создание БД
CREATE DATABASE IF NOT EXISTS chess_tournaments;

-- Установка БД
USE chess_tournaments;

-- Классификатор городов
CREATE TABLE IF NOT EXISTS chess_tournaments.city (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL,
    CONSTRAINT pk_city_id PRIMARY KEY (id)
);

-- Классификатор званий
CREATE TABLE IF NOT EXISTS chess_tournaments.category (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(127) NOT NULL UNIQUE -- чемпиона мира по шахматам, кмс, мастер спорта, 1 разряд, 2разряд, чемпион РФ
);

-- Таблица турниров
CREATE TABLE tournament (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(63) NOT NULL,
    city_id INT UNSIGNED NOT NULL,
    holding_year YEAR NOT NULL CHECK(holding_year > '1900'),
    FOREIGN KEY (city_id) REFERENCES city(id)
);

-- Таблица игроков
CREATE TABLE player (
    id INT UNSIGNED AUTO_INCREMENT,
    full_name VARCHAR(127) NOT NULL,
    age INT UNSIGNED NOT NULL CHECK ((age > 18) AND (age < 120)), -- г.
    gender ENUM ('f', 'm') NOT NULL,
    city_id INT UNSIGNED NOT NULL,
    title_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_player_city FOREIGN KEY (city_id) REFERENCES city (id),
    CONSTRAINT fk_player_title FOREIGN KEY (title_id) REFERENCES category(id),
    CONSTRAINT pk_player_id PRIMARY KEY (id)
);

-- Связка турниров и игроков
CREATE TABLE participation (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    prize DECIMAL(10, 2) UNSIGNED, -- руб.
    tournament_id INT UNSIGNED NOT NULL,
    player_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (tournament_id) REFERENCES tournament(id),
    FOREIGN KEY (player_id) REFERENCES player(id) ON DELETE CASCADE
);
