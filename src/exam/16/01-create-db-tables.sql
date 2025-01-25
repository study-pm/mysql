/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Учет установленного ПО».
 *
 * Атрибуты для хранения в базе данных:
 * - Название программы,
 * - версия,
 * - класс программ (прикладные, системные),
 * - объем,
 * - IP-адрес,
 * - Кабинет,
 * - дата установки,
 * - режим установки (сетевой, локальный, полный, демо-версия и тд.)
 */

-- Создание БД
CREATE DATABASE IF NOT EXISTS soft_installation;

-- Установка БД
USE soft_installation;

-- Классификатор классов программ
CREATE TABLE soft_installation.category (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Классификатор режимов установки
CREATE TABLE soft_installation.mode (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(31) NOT NULL UNIQUE
);

-- Справочник программ
CREATE TABLE software (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL,
    size DECIMAL(10, 2) NOT NULL, -- Размер в Мб
    category_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE room (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    number VARCHAR(7) NOT NULL UNIQUE,
    ip_address VARCHAR(15) NOT NULL UNIQUE,
    CONSTRAINT chk_ip CHECK (ip_address REGEXP '^(\d{1,3}\.){3}\d{1,3}')
);

-- Связка установленного ПО
CREATE TABLE installation (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    installation_date DATE NOT NULL,
    version VARCHAR(7) NOT NULL,
    program_id INT UNSIGNED NOT NULL,
    mode_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_program FOREIGN KEY (program_id) REFERENCES software(id),
    CONSTRAINT fk_mode FOREIGN KEY (mode_id) REFERENCES mode(id)
);

