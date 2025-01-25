/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных «Автомашины» */

/* Атрибуты для хранения в базе данных:*/
-- ФИО владельца,
-- адрес,
-- пол,
-- дата рождения,
-- телефон,
-- № страховки,
-- дата страховки,
-- № машины,
-- модель,
-- цвет,
-- пробег,
-- дата изготовления автомобиля,
-- стоимость машины.

-- Создание базы данных
CREATE DATABASE IF NOT EXISTS car_transport CHARSET utf8 COLLATE utf8_bin;

-- Установка базы данных
USE car_transport;

-- Справочная таблица (классификатор) моделей
CREATE TABLE car_transport.model (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Справочная таблица (классификатор) цветов
CREATE TABLE car_transport.color (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Таблица фактов о владельцах
CREATE TABLE driver (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL,
    gender ENUM('f', 'm') NOT NULL,
    birth_date DATE NOT NULL,
    residential_address VARCHAR(255) NOT NULL,
    phone_number CHAR(10) NOT NULL CHECK(phone_number REGEXP '^[0-9]{10}$'),
    CHECK ((birth_date > create_ts - INTERVAL 120 YEAR) AND (birth_date < create_ts - INTERVAL 18 YEAR))
);

-- Таблица фактов об автомобилях
CREATE TABLE car (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    license_number VARCHAR(9) NOT NULL,
    manufacture_date DATE NOT NULL,
    mileage INT UNSIGNED NOT NULL DEFAULT 0,
    price DECIMAL(10, 2) UNSIGNED NOT NULL,
    color_id INT UNSIGNED NOT NULL,
    model_id INT UNSIGNED NOT NULL,
    CONSTRAINT uq_car_licence UNIQUE (license_number),
    CONSTRAINT chk_car_license CHECK(license_number REGEXP '^[а-я]{1}[0-9]{3}[а-я]{2}\\d{2,3}$'),
    CHECK (manufacture_date < create_ts),    
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (model_id) REFERENCES model(id)
);

-- Таблица фактов о страховых полисах
CREATE TABLE insurance (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    policy_number CHAR(13) NOT NULL UNIQUE CHECK(policy_number REGEXP '^[А-Я]{3}[0-9]{10}$'),
    car_id INT UNSIGNED NOT NULL,
    driver_id INT UNSIGNED NOT NULL,    
    FOREIGN KEY (car_id) REFERENCES car(id) ON DELETE CASCADE,
    FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE CASCADE
);
