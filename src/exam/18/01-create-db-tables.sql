/* Создать в СУБД MySQL или в приложении MySQL WorkBench базу данных – «Учет занятости актеров в театре». */
 
/* Атрибуты для хранения в базе данных: */
 -- название роли,
 -- пьеса,
 -- ФИО артиста,
 -- оклад,
 -- стаж работы,
 -- пол,
 -- звание (Народный артист РФ, Заслуженный артист РФ, Лауреат конкурса),
 -- дата назначения на роль,
 -- название спектакля.

-- Создание БД
CREATE DATABASE IF NOT EXISTS theater_actors;

-- Установка БД
USE theater_actors;

-- Классификатор званий
CREATE TABLE theater_actors.title (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(63) NOT NULL UNIQUE
);

-- Справочник пьес
CREATE TABLE theater_actors.piece (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL,
    CONSTRAINT pk_piece_id PRIMARY KEY(id)
);

-- Справочник ролей
CREATE TABLE theater_actors.role (
    id INT UNSIGNED AUTO_INCREMENT,
    title VARCHAR(63) NOT NULL,
    piece_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_role_piece_id FOREIGN KEY (piece_id) REFERENCES piece(id),
    CONSTRAINT pk_role_id PRIMARY KEY(id)
);

-- Справочник актеров
CREATE TABLE actor (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(127) NOT NULL,
    gender ENUM('f', 'm') NOT NULL,
    salary DECIMAL(10, 2) UNSIGNED NOT NULL,
    experience TINYINT UNSIGNED NOT NULL, -- years
    title_id INT UNSIGNED,
    FOREIGN KEY (title_id) REFERENCES title(id)
);

-- Справочник спектаклей
CREATE TABLE performance (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    set_date DATE NOT NULL,
    piece_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (piece_id) REFERENCES piece(id) ON DELETE CASCADE
);

-- Связка назначений на роли
CREATE TABLE assignment (
    id INT UNSIGNED AUTO_INCREMENT,
    set_date DATE NOT NULL,
    role_id INT UNSIGNED NOT NULL,
    actor_id INT UNSIGNED NOT NULL,
    performance_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_assignment_id PRIMARY KEY (id),
    CONSTRAINT fk_assignment_role_id FOREIGN KEY (role_id) REFERENCES role(id),
    CONSTRAINT fk_assignment_actor_id FOREIGN KEY (actor_id) REFERENCES actor(id),
    CONSTRAINT fk_assignment_performance_id FOREIGN KEY (performance_id) REFERENCES performance(id)
);
