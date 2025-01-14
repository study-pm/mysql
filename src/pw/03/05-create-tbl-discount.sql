-- Создание таблицы СКИДКА

CREATE TABLE discount (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL,
    value DECIMAL(3,2) NOT NULL
);
