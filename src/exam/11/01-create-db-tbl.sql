/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Абитуриент». *.

/* Атрибуты для хранения в базе данных: */
-- ФИО,
-- № паспорта,
-- ИНН,
-- дата рождения,
-- город проживания,
-- средний бал по аттестату,
-- средний балл при поступлении в колледж,
-- название специальности,
-- учебное заведение.
 */

-- Создание БД
CREATE DATABASE IF NOT EXISTS college_entrant;

-- Установка БД
USE college_entrant;

-- Классификатор (справочник) городов
CREATE TABLE college_entrant.city (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Классификатор специальностей
CREATE TABLE specialty (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL CHECK (title <> '')
);

-- Справочник учебных заведений
CREATE TABLE institution (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL,
    CONSTRAINT chk_institution_title CHECK (title <> ''),
    CONSTRAINT pk_institution_id PRIMARY KEY (id)
);

-- Таблица фактов об абитуриентах
CREATE TABLE applicant (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL CHECK (full_name <> ''),
    birth_date DATE NOT NULL,
    passport CHAR(10) NOT NULL UNIQUE CHECK(passport REGEXP "^[0-9]{10}$"),
    -- inn CHAR(12) NOT NULL UNIQUE CHECK(inn LIKE "%[0-9]%"), -- NOT LIKE '%[^0-9]%'
    inn CHAR(12) NOT NULL UNIQUE,
    city_id INT UNSIGNED,
    certificate_score INT UNSIGNED NOT NULL,
    admission_score INT UNSIGNED NOT NULL,
    institution_id INT UNSIGNED NOT NULL,
    specialty_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_applicant_birth CHECK ((birth_date > create_ts - INTERVAL 120 YEAR) AND (birth_date < create_ts - INTERVAL 14 YEAR)),
    -- CONSTRAINT chk_applicant_birth CHECK (TIMESTAMPDIFF(YEAR, birth_date, create_ts) > 14 AND TIMESTAMPDIFF(YEAR, create_ts  - INTERVAL 14 YEAR, birth_date) < 120),
    CONSTRAINT chk_applicant_certificate CHECK (certificate_score < 400),
    CONSTRAINT chk_applicant_admission CHECK (admission_score < 400),
    CONSTRAINT chk_applicant_inn CHECK (inn REGEXP "^\\d{12}"),
    CONSTRAINT chk_applicant_institution FOREIGN KEY (institution_id) REFERENCES institution(id),
    CONSTRAINT chk_applicant_specialty FOREIGN KEY (specialty_id) REFERENCES specialty(id),
    FOREIGN KEY (city_id) REFERENCES city(id)
);
