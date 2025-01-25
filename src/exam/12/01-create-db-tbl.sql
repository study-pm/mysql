/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Турфирма». */

/* Атрибуты для хранения в базе данных: */
-- ФИО клиента,
-- адрес,
-- телефон,
-- страна,
-- название отеля,
-- тип размещения,
-- дата начала путевки,
-- дата окончания путевки,
-- цена путевки.

-- Проверка БД
SHOW DATABASES LIKE '%travel';

-- Удаление существующей БД
DROP DATABASE IF EXISTS travel_agency;

-- Создание БД
CREATE DATABASE IF NOT EXISTS travel_agency;

-- Установка БД
USE travel_agency;

-- Проверка текущей БД
SELECT DATABASE();

-- Классификатор (справочник) стран
CREATE TABLE travel_agency.country (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE CHECK (title <> '')
);

-- Классификатор отелей
CREATE TABLE travel_agency.hotel (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL CHECK (title <> '')
);

-- Классификатор размещений
CREATE TABLE travel_agency.accommodation (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE CHECK (title <> '')
);

-- Таблица фактов о клиентах
CREATE TABLE client (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(127) NOT NULL CHECK (full_name <> ''),
    residential_address VARCHAR(255) NOT NULL,
    phone CHAR(10) NOT NULL UNIQUE CHECK (phone REGEXP '^[0-9]{10}$') -- LIKE %[0-9]%
);

-- Таблица фактов о путевках
CREATE TABLE tour (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    accommodation_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    country_id INT UNSIGNED NOT NULL,
    hotel_id INT UNSIGNED NOT NULL,    
    CONSTRAINT chk_start_end CHECK (start_date < end_date),
    FOREIGN KEY fk_accommodation (accommodation_id) REFERENCES accommodation(id),
    FOREIGN KEY fk_client (client_id) REFERENCES client(id) ON DELETE CASCADE,
    FOREIGN KEY fk_country (country_id) REFERENCES country(id),
    FOREIGN KEY fk_hotel (hotel_id) REFERENCES hotel(id) ON DELETE CASCADE
);
