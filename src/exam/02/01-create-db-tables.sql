/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных «Специализация рабочих». */

/* Атрибуты для хранения в базе данных: */
-- ФИО,
-- дата рождения,
-- образование,
-- пол,
-- специальность,
-- разряд,
-- дата начала работы,
-- номер цеха (1, 2, 3),
-- надбавка.

-- Create database
CREATE DATABASE IF NOT EXISTS workers_specialization CHARSET utf8 COLLATE utf8_bin;

-- Make database current
USE workers_specialization;

-- Классификатор образования
CREATE TABLE IF NOT EXISTS workers_specialization.education (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Классификатор специальностей
CREATE TABLE IF NOT EXISTS workers_specialization.specialty (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Таблица рабочих
CREATE TABLE IF NOT EXISTS worker(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('м', 'ж') NOT NULL,
    grade ENUM('1', '2', '3', '4', '5', '6') NOT NULL,
    start_date DATE NOT NULL,
    workshop_number ENUM('1', '2', '3') NOT NULL,
    bonus DECIMAL(10, 2),
    education_id INT UNSIGNED NOT NULL,
    specialty_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (education_id) REFERENCES education(id),
    FOREIGN KEY (specialty_id) REFERENCES specialty(id),
    CHECK(birth_date > '1920-01-01' AND birth_date < DATE(create_ts) - INTERVAL 18 YEAR),
    CHECK(start_date > '1920-01-01' AND start_date < DATE(create_ts))
);
