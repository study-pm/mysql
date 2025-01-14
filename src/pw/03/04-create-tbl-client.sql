-- Создание таблицы КЛИЕНТЫ

CREATE TABLE client (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    second_name VARCHAR(20) NOT NULL,
    passport_number CHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    address VARCHAR(100),
    comment TEXT
);
