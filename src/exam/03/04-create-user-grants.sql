/* Создать пользователя и дать ему возможность изменять данные в таблице Турист. */

-- Создание пользователя с паролем
CREATE USER tourist_sports_usr@localhost;

-- Выдача привилегий
GRANT UPDATE ON tourist_sports.tourist TO tourist_sports_usr@localhost;
FLUSH PRIVILEGES;
