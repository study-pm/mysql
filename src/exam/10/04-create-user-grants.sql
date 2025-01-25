/* Создать пользователя и дать ему возможность удалять и изменять данные в таблице Водитель. */

-- Создание пользователя с паролем
CREATE USER cargo_traffic_usr@localhost IDENTIFIED BY '123';

-- Проверка создания пользователя
SHOW CREATE USER cargo_traffic_usr@localhost;
SELECT user, host, authentication_string FROM mysql.user WHERE user LIKE 'cargo%';

-- Назначение привилегий
GRANT DELETE, UPDATE ON cargo_traffic.driver TO cargo_traffic_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;

-- Проверка привилегий
SHOW GRANTS FOR cargo_traffic_usr@localhost;
