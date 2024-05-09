-- Usage:
-- \. create-tables-hotel.sql
-- source create-tables-hotel.sql

CREATE TABLE comfort (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(10) NOT NULL,
    CONSTRAINT comfort_name_uq UNIQUE(type_name),
    CONSTRAINT comfort_name_ne_chk CHECK(type_name <> '')
);

CREATE TABLE room (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(10) NOT NULL,
    capacity TINYINT UNSIGNED NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    comfort_id INT UNSIGNED NOT NULL,
    CONSTRAINT room_number_uq UNIQUE(number),
    CONSTRAINT room_number_ne CHECK(number <> ''),
    CONSTRAINT room_capacity_rg CHECK(capacity > 0 AND capacity < 20),
    CONSTRAINT room_price_rg CHECK(price > 0),
    CONSTRAINT room_phone_uq UNIQUE(phone_number),
    CONSTRAINT room_phone_pattern CHECK(phone_number REGEXP '^[0-9]{1,10}$'),
    CONSTRAINT room_comfort_fk FOREIGN KEY (comfort_id)
        REFERENCES comfort(_id) ON DELETE CASCADE
);

CREATE TABLE client (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    second_name VARCHAR(20) NOT NULL,
    passport_number CHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    address VARCHAR(100),
    comment TEXT,
    CONSTRAINT client_name_ne CHECK(last_name != '' AND first_name != ''),
    CONSTRAINT client_passport_uq UNIQUE(passport_number),
    CONSTRAINT client_passport_pt CHECK(passport_number REGEXP '^[0-9]{10}$'),
    CONSTRAINT client_birth_rg CHECK(birth_date > '1904-01-01')
);

CREATE TABLE discount (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL,
    value DECIMAL(3,2) UNSIGNED NOT NULL,
    CONSTRAINT discount_category_uq UNIQUE(category_name),
    CONSTRAINT discount_category_ne CHECK(category_name <> ''),
    CONSTRAINT discount_value_rg CHECK(value > 0)
);

CREATE TABLE client_discount (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    client_id INT UNSIGNED NOT NULL,
    discount_id INT UNSIGNED NOT NULL,
    CONSTRAINT cd_client_fk FOREIGN KEY(client_id)
        REFERENCES client(_id) ON DELETE CASCADE,
    CONSTRAINT cd_discount_fk FOREIGN KEY(discount_id)
        REFERENCES discount(_id) ON DELETE CASCADE
);

CREATE TABLE phone (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number CHAR(10) NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    CONSTRAINT phone_number_uq UNIQUE(number),
    CONSTRAINT phone_number_pt CHECK(number REGEXP '^[0-9]{10}$'),
    CONSTRAINT phone_client_fk FOREIGN KEY(client_id)
        REFERENCES client(_id) ON DELETE CASCADE
);

CREATE TABLE reservation (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    enter_date DATE NOT NULL,
    leave_date DATE NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    CONSTRAINT reservation_ts_rg CHECK(date_ts > '2020-01-01 00:00:00'),
    CONSTRAINT reservation_date_chk
        CHECK(enter_date > '2000-01-01' && leave_date > enter_date),
    CONSTRAINT reservation_room_fk FOREIGN KEY(room_id)
        REFERENCES room(_id) ON DELETE CASCADE,
    CONSTRAINT reservation_client_fk FOREIGN KEY(client_id)
        REFERENCES client(_id) ON DELETE CASCADE
);

CREATE TABLE checkin (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    enter_date DATE NOT NULL,
    leave_date DATE NOT NULL,
    room_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    CONSTRAINT checkin_ts_rg CHECK(date_ts > '2018-01-01 00:00:00'),
    CONSTRAINT checkin_date_chk
        CHECK(enter_date > '2018-01-01' && leave_date > enter_date),
    CONSTRAINT checkin_room_fk FOREIGN KEY(room_id)
        REFERENCES room(_id) ON DELETE CASCADE,
    CONSTRAINT checkin_client_fk FOREIGN KEY(client_id)
        REFERENCES client(_id) ON DELETE CASCADE
);
