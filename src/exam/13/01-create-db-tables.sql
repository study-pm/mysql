/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Поручения в организации». */

/* Атрибуты для хранения в базе данных:*/
-- название поручения,
-- трудоемкость (числовой показатель),
-- ФИО сотрудника,
-- должность,
-- оклад,
-- дата выдачи задания,
-- дата завершения задания,
-- оценка выполненной работы (неуд, удовл, хор, отл).

-- Удаление существующей БД
DROP DATABASE IF EXISTS company_assignments;

-- Создание БД
CREATE DATABASE IF NOT EXISTS company_assignments;

-- Установка БД
USE company_assignments;

-- Классификатор должностей
CREATE TABLE company_assignments.office (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL UNIQUE CHECK (title <> '')
);

-- Классификатор оценок
CREATE TABLE company_assignments.performance (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(31) NOT NULL UNIQUE CHECK (title <> ''),
    short VARCHAR(7) NOT NULL UNIQUE CHECK (short <> ''),
    grade INT UNSIGNED NOT NULL CHECK(grade IN (2, 3, 4, 5))
);

-- Справочник сотрудников
CREATE TABLE assignee (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(127) NOT NULL CHECK (full_name <> ''),
    salary DECIMAL(10, 2) NOT NULL CHECK (salary > 0),
    position_id INT UNSIGNED NOT NULL,
    FOREIGN KEY fk_position (position_id) REFERENCES office(id)
);

-- Справочник поурчений
CREATE TABLE assignment (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(127) NOT NULL,
    labor_intensity INT UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    assignee_id INT UNSIGNED,
    performance_id INT UNSIGNED,
    CONSTRAINT chk_title CHECK (title <> ''),
    CONSTRAINT chk_start_end CHECK (start_date <= end_date),
    CONSTRAINT fk_assignee FOREIGN KEY (assignee_id) REFERENCES assignee(id) ON DELETE CASCADE,
    CONSTRAINT fk_performance FOREIGN KEY (performance_id) REFERENCES performance(id)
);
