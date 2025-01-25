/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Учета научных конференций».
 *
 * Атрибуты для хранения в базе данных:
 * - ФИО ученого, дата рождения, оклад, страна проживания, ученая степень (магистр, кандидат, доктор наук) название конференции, тема конференции, дата проведения, страна проведения.
 */

-- Создание БД
CREATE DATABASE IF NOT EXISTS scientific_conferences;

-- Установка БД
USE scientific_conferences;

-- Классификатор классов программ
CREATE TABLE soft_installation.category (
    id INT UNSIGNED AUTO_INCREMENT,    
    title VARCHAR(63) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

-- Классификатор режимов установки
CREATE TABLE soft_installation.mode (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(31) NOT NULL,
    CONSTRAINT pk_mode_id PRIMARY KEY (id),
    CONSTRAINT uq_mode_title UNIQUE(title)
);

-- Справочник программ
CREATE TABLE software (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL,
    size DECIMAL(10, 2) NOT NULL, -- Размер в Мб
    category_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_software_category_id FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Справочник кабинетов
CREATE TABLE room (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    number VARCHAR(7) NOT NULL UNIQUE,
    ip_address VARCHAR(15) NOT NULL UNIQUE,
    CONSTRAINT chk_room_ip CHECK (ip_address REGEXP '^(\d{1,3}\.){3}\d{1,3}')
);

-- Связка установленного ПО
CREATE TABLE installation (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    installation_date DATE NOT NULL,
    version VARCHAR(7) NOT NULL,
    program_id INT UNSIGNED NOT NULL,
    mode_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_installation_program_id FOREIGN KEY (program_id) REFERENCES software(id),
    CONSTRAINT fk_installation_mode_id FOREIGN KEY (mode_id) REFERENCES mode(id)
);

