-- Создать пользователя и дать ему возможность удалять и изменять данные в таблицу Футболист.

-- Создание пользователя с паролем
CREATE USER football_user@localhost IDENTIFIED BY '123';

-- Выдача привилегий
GRANT DELETE, UPDATE ON football_games.player TO football_user@localhost;
FLUSH PRIVILEGES;
