/* Создать пользователя и дать ему возможность добавлять и изменять данные в таблицу Судно. */

-- Создание пользователя с паролем
CREATE USER boat_park_usr@localhost IDENTIFIED BY '123';

-- Выдача привилегий
 GRANT INSERT, UPDATE ON boat_park.ship TO boat_park_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;
