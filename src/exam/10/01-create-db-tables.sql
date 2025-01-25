/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Грузоперевозки». */

/* Атрибуты для хранения в базе данных: */
-- ФИО водителя,
-- дата поступления на работу,
-- оклад,
-- дата рождения водителя,
-- вид перевозимого груза,
-- стоимость груза,
-- вес груза,
-- дата перевозки,
-- город, куда доставляются грузы.

-- Создание БД
CREATE DATABASE IF NOT EXISTS cargo_traffic;

-- Установка БД
USE cargo_traffic;

-- Классификатор видов грузов
CREATE TABLE cargo_traffic.cargo_type (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE CHECK (title <> '')
);

-- Классификатор городов
CREATE TABLE cargo_traffic.city (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(63) NOT NULL CHECK (title <> '')
);

-- Таблица водителей
CREATE TABLE driver (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL,
    gender ENUM('f', 'm') NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) UNSIGNED NOT NULL,
    CONSTRAINT chk_driver_name CHECK (full_name <> ''),
    CONSTRAINT chk_driver_birth CHECK(TIMESTAMPDIFF(YEAR, birth_date, create_ts) > 18 AND TIMESTAMPDIFF(YEAR, birth_date, create_ts) < 100),    
    CONSTRAINT chk_driver_hire CHECK ((birth_date > hire_date - INTERVAL 120 YEAR) AND (birth_date < hire_date - INTERVAL 18 YEAR))
);

-- Таблица перевозок
CREATE TABLE transportation (
    id INT UNSIGNED AUTO_INCREMENT,
    transport_date DATE NOT NULL,
    cargo_type INT UNSIGNED NOT NULL,
    cargo_cost DECIMAL(10, 2) NOT NULL,
    cargo_weight DECIMAL(10, 2) NOT NULL, -- kg
    delivery_city INT UNSIGNED NOT NULL,
    driver_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_transportation_cost CHECK (cargo_cost > 0),
    CONSTRAINT chk_transportation_weight CHECK (cargo_weight > 0),
    CONSTRAINT fk_transportation_cargo FOREIGN KEY (cargo_type) REFERENCES cargo_type(id),
    CONSTRAINT fk_transportation_city FOREIGN KEY (delivery_city) REFERENCES city(id),
    CONSTRAINT fk_transportation_driver FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE CASCADE,
    CONSTRAINT pk_transportation_id PRIMARY KEY (id)
);
