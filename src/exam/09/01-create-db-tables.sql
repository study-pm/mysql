/* Создать в СУБД MySQL или в приложении MySQLWorkBench базу данных – «Учет игр футболистов». *.

/* Атрибуты для хранения в базе данных: */
-- название команды,
-- город, где находится команда,
-- ФИО тренера,
-- телефон,
-- название стадиона,
-- вместимость,
-- ФИО футболистов,
-- дата рождения,
-- амплуа (защитник, нападающий, полузащитник, вратарь…),
-- зарплата футболиста,
-- дата проведения игр,
-- стадион, где проводилась игра,
-- результат игры,
-- команды, которые играли между собой.
 */

DROP DATABASE IF EXISTS football_games;

-- Создание БД
CREATE DATABASE IF NOT EXISTS football_games;

-- Установка БД
USE football_games;

-- Классификатор (справочник) городов
CREATE TABLE football_games.city (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL CHECK (title <> '')
);

-- Классификатор амплуа игроков
CREATE TABLE football_games.player_position (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(63) NOT NULL UNIQUE CHECK (title <> '')
);

-- Справочник игровых площадок
CREATE TABLE football_games.venue (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    capacity INT UNSIGNED NOT NULL, -- количество человек
    city_id INT UNSIGNED NOT NULL,
    title VARCHAR(127) NOT NULL CHECK (title <> ''),
    FOREIGN KEY (city_id) REFERENCES city(id)
);

-- Таблица тренеров
CREATE TABLE coach (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(127) NOT NULL CHECK (full_name <> ''),
    phone_number CHAR(10) NOT NULL CHECK (phone_number REGEXP '^\\d{10}$')
);

-- Таблица команд
CREATE TABLE team (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL,
    city_id INT UNSIGNED NOT NULL,
    coach_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_team_title CHECK (title <> ''),
    CONSTRAINT fk_team_city FOREIGN KEY (city_id) REFERENCES city(id),
    CONSTRAINT fk_team_coach FOREIGN KEY (coach_id) REFERENCES coach(id),
    CONSTRAINT pk_team_id PRIMARY KEY (id)
);

-- Таблица игроков
CREATE TABLE player (
    id INT UNSIGNED AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL,
    birth_date DATE NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    team_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_player_birth CHECK (TIMESTAMPDIFF(YEAR, birth_date, create_ts) > 18 AND TIMESTAMPDIFF(YEAR, birth_date, create_ts) < 50),
    CONSTRAINT chk_player_name CHECK (full_name <> ''),
    CONSTRAINT chk_player_salary CHECK (salary > 0),
    CONSTRAINT fk_player_position FOREIGN KEY (position_id) REFERENCES player_position(id),
    CONSTRAINT fk_player_team FOREIGN KEY (team_id) REFERENCES team(id),
    CONSTRAINT pk_player_id PRIMARY KEY (id)
);

-- Таблица игр
CREATE TABLE game (
    id INT UNSIGNED AUTO_INCREMENT,
    stadium_id INT UNSIGNED NOT NULL,
    holding_date DATE NOT NULL,
    team1_score INT UNSIGNED,
    team2_score INT UNSIGNED,
    team1_id INT UNSIGNED NOT NULL,
    team2_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_game_team CHECK (team1_id <> team2_id),
    CONSTRAINT fk_game_stadium FOREIGN KEY (stadium_id) REFERENCES venue(id),
    CONSTRAINT fk_game_team1 FOREIGN KEY (team1_id) REFERENCES team(id),
    CONSTRAINT fk_game_team2 FOREIGN KEY (team1_id) REFERENCES team(id),
    CONSTRAINT pk_game_id PRIMARY KEY (id)
);
