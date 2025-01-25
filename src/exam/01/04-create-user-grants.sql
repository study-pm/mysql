/* Создать пользователя и дать ему право только просматривать таблицу шахматистов. */

-- Создание пользователя с паролем
CREATE USER chess_tournaments_user@localhost IDENTIFIED BY '123';

-- Выдача привилегий
GRANT UPDATE ON chess_tournaments.player TO chess_tournaments_user@localhost;
FLUSH PRIVILEGES;
