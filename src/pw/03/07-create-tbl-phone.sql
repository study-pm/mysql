-- Создание таблицы ТЕЛЕФОНЫ

CREATE TABLE phone (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number CHAR(10) NOT NULL,
    client_id INT UNSIGNED NOT NULL
);
