-- Usage:
-- \. create-tables-hotel.sql
-- source create-tables-hote.sql

CREATE TABLE comfort (
    _id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(10) NOT NULL,
    CONSTRAINT comfort_name_uq UNIQUE(type_name),
    CONSTRAINT comfort_name_ne_chk CHECK(type_name <> '')
);
