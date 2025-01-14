-- Создание таблицы ПОСЕЛЕНИЯ

CREATE TABLE reservation (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    enter_date DATE NOT NULL,
    leave_date DATE NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL
);
