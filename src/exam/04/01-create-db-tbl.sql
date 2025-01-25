/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных «Служба занятости». */

/* Атрибуты для хранения в базе данных:*/
-- ФИО претендента,
-- дата рождения,
-- образование,
-- количество детей,
-- пол,
-- специальность по образованию,
-- адрес предлагаемой работы, 
-- должность,
-- стаж работы,
-- оклад,
-- название фирмы, которой требуется специалист.

-- Создание базы данных
CREATE DATABASE IF NOT EXISTS employment_service;

-- Установка базы данных
USE employment_service;

-- Справочная таблица (классификатор) об образовании
CREATE TABLE employment_service.education (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63)
);

-- Справочная таблица (классификатор) должностей
CREATE TABLE employment_service.job_position (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127)
);

-- Таблица фактов о компаниях
CREATE TABLE company (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(127) NOT NULL,
    company_address VARCHAR(255) NOT NULL
);

-- Таблица фактов о вакансиях
CREATE TABLE vacancy (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    experience INT UNSIGNED CHECK (experience < 20),
    salary DECIMAL(10, 2) NOT NULL CHECK (salary > 0),
    gender ENUM('f', 'm'),
    max_age INT UNSIGNED CHECK (max_age < 80),
    company_id INT UNSIGNED NOT NULL,
    education_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
    FOREIGN KEY (education_id) REFERENCES education(id),
    FOREIGN KEY fk_position (position_id) REFERENCES job_position(id) ON DELETE CASCADE
);

-- Таблица фактов о претендентах (соискателях)
CREATE TABLE candidate (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL,
    birth_date DATE NOT NULL,    
    gender ENUM('f', 'm'),
    children_number INT UNSIGNED NOT NULL DEFAULT 0 CHECK (children_number < 20),
    specialty VARCHAR(127) NOT NULL,
    experience INT UNSIGNED NOT NULL CHECK (experience < 100),
    salary DECIMAL(10, 2) UNSIGNED,
    education_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    CHECK ((birth_date > create_ts - INTERVAL 120 YEAR) AND (birth_date < create_ts - INTERVAL 18 YEAR)),
    FOREIGN KEY (education_id) REFERENCES education(id),
    FOREIGN KEY fk_position (position_id) REFERENCES job_position(id)
);
