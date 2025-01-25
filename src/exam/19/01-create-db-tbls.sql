/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Поездки машин».

/* Атрибуты для хранения в базе данных: */
-- гос. номер,
-- марка,
-- год выпуска,
 * - ФИО водителя,
 * - категория водителя,
 * - стаж работы,
 * - дата выезда,
 * - дата возвращения,
 * - пункт назначения,
 * - начальный пробег,
 * - конечный пробег.
 */

-- Создание БД
CREATE DATABASE IF NOT EXISTS car_trips;

-- Установка БД
USE car_trips;

-- Классификатор марок автомобилей
CREATE TABLE car_trips.brand (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(31) NOT NULL,
    CONSTRAINT pk_brand_id PRIMARY KEY (id),
    CONSTRAINT uq_brands_title UNIQUE (title)
);

-- Справочник пунктов
CREATE TABLE car_trips.station (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL,
    PRIMARY KEY (id)
);

-- Справочник водителей
CREATE TABLE driver (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(63) NOT NULL,
    category ENUM('A', 'B', 'C', 'D', 'E') NOT NULL,
    experience INT UNSIGNED CHECK (experience < 100)
);

-- Справочник автомобилей
CREATE TABLE car (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    license_plate VARCHAR(9) NOT NULL,
    manufacture_year YEAR NOT NULL,
    brand_id INT UNSIGNED NOT NULL,
    driver_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_car_license_plate CHECK(license_plate REGEXP '^[а-я]{1}\\d{3}[а-я]{2}\\d{2,3}$'),
    CONSTRAINT fk_car_brand_id FOREIGN KEY (brand_id) REFERENCES brand(id),
    CONSTRAINT fk_car_driver_id FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE CASCADE,
    CONSTRAINT uk_car_license_plate UNIQUE(license_plate)
);

-- Справочник поездок
CREATE TABLE trip (
    id INT UNSIGNED AUTO_INCREMENT,
    departure_date DATE NOT NULL,
    return_date DATE NOT NULL,
    destination_id INT UNSIGNED NOT NULL,
    initial_mileage INT UNSIGNED NOT NULL,
    final_mileage INT UNSIGNED NOT NULL,
    car_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_trip_mileage CHECK (final_mileage >= initial_mileage),
    CONSTRAINT chk_trip_dates CHECK (return_date >= departure_date),
    CONSTRAINT fk_trip_car_id FOREIGN KEY (car_id) REFERENCES car(id),
    CONSTRAINT fk_trip_destination_id FOREIGN KEY (destination_id) REFERENCES station(id),
    CONSTRAINT pk_trip_id PRIMARY KEY(id)
);
