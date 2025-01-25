/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных — «Парк судов». */

/* Атрибуты для хранения в базе данных: */
-- проект судна,
-- мощность,
-- грузоподъёмность,
-- название судна,
-- дата выпуска,
-- стоимость судна,
-- затраты топлива на 1 км пути,
-- затраты топлива на 1 час пути,
-- ФИО капитана,
-- ФИО члена команды,
-- его дата рождения.

-- Создание БД
CREATE DATABASE IF NOT EXISTS boat_park;

-- Установка БД
USE boat_park;

-- Классификатор должностей
CREATE TABLE boat_park.job_position (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position VARCHAR(63) NOT NULL CHECK (position <> '')
);

-- Классификатор проектов
CREATE TABLE ship_project (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL,
    CONSTRAINT chk_project_title CHECK (title <> ''),
    CONSTRAINT pk_project_id PRIMARY KEY(id),
    CONSTRAINT uq_project_title UNIQUE (title)
);

-- Справочник судов
CREATE TABLE ship (
    id INT UNSIGNED AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(127) NOT NULL,
    manufacture_date DATE NOT NULL,
    power DECIMAL(10, 2) NOT NULL,
    carrying_capacity DECIMAL(10, 2) NOT NULL,
    consumption_per_km DECIMAL(10, 2) NOT NULL,
    consumption_per_h DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    project_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_ship_capacity CHECK (carrying_capacity > 0),
    CONSTRAINT chk_ship_consumption CHECK (consumption_per_h > 0 AND consumption_per_km > 0),
    CONSTRAINT chk_ship_manufacture CHECK (manufacture_date <= create_ts),
    CONSTRAINT chk_ship_power CHECK (power > 0),
    CONSTRAINT chk_ship_price CHECK (price > 0),
    CONSTRAINT chk_ship_title CHECK (title != ''),
    CONSTRAINT fk_ship_project FOREIGN KEY (project_id) REFERENCES ship_project(id),
    CONSTRAINT pk_ship_id PRIMARY KEY (id)
);

-- Справочник экипажа
CREATE TABLE crew (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL CHECK (full_name <> ''),
    birth_date DATE NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    ship_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_crew_birth CHECK (TIMESTAMPDIFF(YEAR, birth_date, create_ts) > 16),
    CONSTRAINT fk_crew_position FOREIGN KEY (position_id) REFERENCES job_position(id),
    CONSTRAINT fk_crew_ship FOREIGN KEY (ship_id) REFERENCES ship(id)
);
