/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных «Состав блюд». */
 
/* Атрибуты для хранения в базе данных:*/
-- ФИО повара,
-- дата рождения повара,
-- пол,
-- название блюда,
-- вид блюда (супы, второе, закуски),
-- наценка на блюдо,
-- название ингредиента,
-- количество ингредиента в блюде,
-- цена блюда.

-- Создание базы данных
CREATE DATABASE IF NOT EXISTS dishes_composition CHARSET utf8 COLLATE utf8_bin;

-- Установка базы данных
USE dishes_composition;

-- Справочная таблица (классификатор) ингрединетов
CREATE TABLE dishes_composition.ingredient (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL UNIQUE
);

-- Таблица фактов о поварах
CREATE TABLE chef (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    create_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(127) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('f', 'm') NOT NULL,
    CHECK ((birth_date > create_ts - INTERVAL 120 YEAR) AND (birth_date < create_ts - INTERVAL 18 YEAR))
);

-- Справочник блюд
CREATE TABLE dish (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(127) NOT NULL,
    dish_type ENUM('суп', 'второе', 'закуска') NOT NULL,
    price  DECIMAL(10, 2) UNSIGNED NOT NULL,
    price_markup DECIMAL(10, 2) UNSIGNED,
    chef_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (chef_id) REFERENCES chef(id)
);

-- Связка составов блюд
CREATE TABLE contents (
    id INT UNSIGNED AUTO_INCREMENT,
    dish_id INT UNSIGNED NOT NULL,
    ingredient_id INT UNSIGNED NOT NULL,
    ingredient_weight INT UNSIGNED NOT NULL,
    CONSTRAINT fk_contents_dish FOREIGN KEY (dish_id) REFERENCES dish(id) ON DELETE CASCADE,
    CONSTRAINT fk_contents_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredient(id) ON DELETE CASCADE,
    CONSTRAINT pk_contents_id PRIMARY KEY (id)
);
