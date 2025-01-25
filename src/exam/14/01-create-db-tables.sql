/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Ремонт автомашин». */

/* Атрибуты для хранения в базе данных: */
-- ФИО механика,
-- разряд механика,
-- оклад,
-- гос. номер машины,
-- марка,
-- год выпуска,
-- ФИО владельца,
-- телефон,
-- адрес,
-- дата приемки заказа на ремонт,
-- дата получения заказа,
-- неисправность,
-- описание выполненных работ,
-- трудоемкость в днях.

-- Создание БД
CREATE DATABASE IF NOT EXISTS car_repair;

-- Установка БД
USE car_repair;

-- Классификатор марок автомобилей
CREATE TABLE car_repair.brand (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL UNIQUE
);

-- Справочник механиков
CREATE TABLE mechanic (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(127) NOT NULL,
    grade ENUM ('1', '2', '3', '4', '5', '6') NOT NULL,
    salary DECIMAL(10, 2) UNSIGNED NOT NULL
);

-- Таблица владельцев
CREATE TABLE owner (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(127) NOT NULL CHECK (full_name <> ''),
    phone_number CHAR(10) NOT NULL CHECK (phone_number REGEXP '^\\d{10}$'), -- LIKE '%[0-9]%'
    address VARCHAR(255) NOT NULL CHECK (address <> '')
);

-- Справочник автомашин
CREATE TABLE car (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    license_plate VARCHAR(9) NOT NULL,
    brand_id INT UNSIGNED NOT NULL,
    manufacture_year YEAR NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_car_license CHECK(license_plate REGEXP '^[а-я]{1}\\d{3}[а-я]{2}\\d{2,3}$'), -- REGEXP_LIKE(), RLIKE, LIKE %   
    CONSTRAINT chk_car_manufacture CHECK (manufacture_year <= create_ts),
    CONSTRAINT fk_car_brand FOREIGN KEY (brand_id) REFERENCES brand(id),
    CONSTRAINT fk_car_owner FOREIGN KEY (owner_id) REFERENCES owner(id)
);

-- Таблица ордеров
CREATE TABLE repair_order (
    id INT UNSIGNED AUTO_INCREMENT,
    start_date DATE NOT NULL,
    end_date DATE,
    car_id INT UNSIGNED NOT NULL,
    assignee_id INT UNSIGNED,
    fault_description TEXT NOT NULL,
    work_description TEXT,
    labor_intensity INT NOT NULL, -- days
    CONSTRAINT chk_order_fault CHECK (fault_description <> ''),
    CONSTRAINT chk_order_work CHECK (work_description <> ''),
    CONSTRAINT fk_order_assignee FOREIGN KEY (assignee_id) REFERENCES mechanic(id),
    CONSTRAINT fk_order_car FOREIGN KEY (car_id) REFERENCES car(id),
    CONSTRAINT pk_order_id PRIMARY KEY (id)
);
