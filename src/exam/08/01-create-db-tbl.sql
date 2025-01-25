/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных — «Книги». */

/* Атрибуты для хранения в базе данных: */
-- название книги,
-- ФИО автора,
-- цена книги,
-- количество страниц,
-- наличие иллюстраций,
-- название книги,
-- телефон автора,
-- название издательства,
-- количество экземпляров книги,
-- жанр книги,
-- цена книги,
-- год издания.

-- Создание БД
CREATE DATABASE IF NOT EXISTS book_depository CHARSET utf8 COLLATE utf8_bin;

-- Установка БД
USE book_depository;

-- Классификатор (справочник) жанров
CREATE TABLE book_depository.genre (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Справочник авторов
CREATE TABLE book_depository.author (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(127) NOT NULL CHECK(full_name <> ''),
    phone_number CHAR(10) CHECK (phone_number REGEXP '^\\d{10}$')
);

-- Справочник издательств
CREATE TABLE publisher (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(127) NOT NULL CHECK (title <> '')
);

-- Таблица книг
CREATE TABLE book (
    id INT UNSIGNED AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(127) NOT NULL,
    author_id INT UNSIGNED NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    page_count INT UNSIGNED NOT NULL,
    is_illustrated BOOLEAN NOT NULL,
    copies INT UNSIGNED NOT NULL,
    genre_id INT UNSIGNED NOT NULL,
    publishing_year YEAR NOT NULL,
    publisher_id INT UNSIGNED NOT NULL,
    CONSTRAINT chk_book_price CHECK (price > 0),
    CONSTRAINT chk_book_title CHECK (title <> ''),
    CONSTRAINT chk_book_year CHECK (publishing_year <= YEAR(create_ts)),
    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author(id),
    CONSTRAINT fk_book_genre FOREIGN KEY (genre_id) REFERENCES genre(id),
    CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    CONSTRAINT pk_book_id PRIMARY KEY (id)
);
