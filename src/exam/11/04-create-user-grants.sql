/* Создать пользователя и дать ему возможность осуществлять поиск данных в таблице Абитуриент. */

-- Создание пользователя с паролем
CREATE USER college_entrant_usr@localhost IDENTIFIED BY '123';

-- Проверка успешности создания пользователя
SHOW CREATE USER college_entrant_usr@localhost;
SELECT user, host, authentication_string from mysql.user where user LIKE 'college%';

-- Выдача привилегий
GRANT SELECT ON college_entrant.applicant TO college_entrant_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;

-- Проверка привилегий
SHOW GRANTS FOR college_entrant_usr@localhost;
