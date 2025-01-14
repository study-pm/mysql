-- Создание таблицы КЛИЕНТЫ_СКИДКИ

CREATE TABLE client_discount (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    client_id INT UNSIGNED NOT NULL,
    discount_id INT UNSIGNED NOT NULL
);
