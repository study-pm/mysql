-- Создать пользователя и дать ему возможность добавлять и изменять данные в таблицу Книга.

-- Создание пользователя с паролем
CREATE USER book_depository_usr@localhost IDENTIFIED BY '123';

-- Выдача привилегий
GRANT INSERT, UPDATE on book_depository.book TO book_depository_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;
