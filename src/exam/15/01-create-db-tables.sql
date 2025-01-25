/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Контроль оплаты услуг». */

/* Атрибуты для хранения в базе данных: */
-- ФИО владельца,
-- адрес,
-- площадь квартиры,
-- количество проживающих,
-- наименование услуги,
-- дата оплаты за услугу,
-- цена услуги

-- Создание БД
CREATE DATABASE IF NOT EXISTS payment_control;

-- Установка БД
USE payment_control;

-- Классификатор услуг
CREATE TABLE payment_control.service (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL UNIQUE,
    rate DECIMAL(10, 2) NOT NULL
);

-- Справочник жилья
CREATE TABLE apartment (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(127) NOT NULL,
    area DECIMAL(5, 2) UNSIGNED NOT NULL,
    owner_name VARCHAR(127) NOT NULL,
    residents_number TINYINT UNSIGNED NOT NULL
);

-- Связующая таблица счет (Связка предоставленных услуг и квартир)
CREATE TABLE bill (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    charged_amt DECIMAL (10, 2) UNSIGNED NOT NULL,
    payment_date DATE,
    paid_amt DECIMAL (10, 2) UNSIGNED,
    apartment_id INT UNSIGNED NOT NULL,
    service_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_payment CHECk (payment_date > create_ts),
    CONSTRAINT fk_apartment FOREIGN KEY (apartment_id) REFERENCES apartment(id) ON DELETE CASCADE,
    CONSTRAINT fk_service FOREIGN KEY (service_id) REFERENCES service(id)
);

-- Создание БД
CREATE DATABASE IF NOT EXISTS payment_control;

-- Установка БД
USE payment_control;

-- Классификатор услуг
CREATE TABLE payment_control.service (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL UNIQUE,
    rate DECIMAL(10, 2) NOT NULL
);

-- Справочник жилья
CREATE TABLE apartment (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(127) NOT NULL,
    area DECIMAL(5, 2) UNSIGNED NOT NULL,
    owner_name VARCHAR(127) NOT NULL,
    residents_number TINYINT UNSIGNED NOT NULL
);

-- Связующая таблица счет (Связка предоставленных услуг и квартир)
CREATE TABLE bill (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    charged_amt DECIMAL (10, 2) UNSIGNED NOT NULL,
    payment_date DATE,
    paid_amt DECIMAL (10, 2) UNSIGNED,
    apartment_id INT UNSIGNED NOT NULL,
    service_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_payment CHECk (payment_date > create_ts),
    CONSTRAINT fk_apartment FOREIGN KEY (apartment_id) REFERENCES apartment(id) ON DELETE CASCADE,
    CONSTRAINT fk_service FOREIGN KEY (service_id) REFERENCES service(id)
);
