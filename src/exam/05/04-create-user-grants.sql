/* Создать пользователя и дать ему возможность добавлять данные в таблицу Повар. */

-- Создание пользователя с паролем
CREATE USER dishes_composition_user@localhost IDENTIFIED BY '123';

-- Выдача привилегий
GRANT INSERT ON dishes_composition.chef TO dishes_composition_user@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;
