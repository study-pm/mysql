/* Создать пользователя и дать ему возможность осуществлять поиск и удаление данных в таблице Клиент. */

-- Создание пользователя с паролем
CREATE USER travel_agency_usr@localhost IDENTIFIED BY '123';

-- Проверка успешности создания пользователя
SHOW CREATE USER travel_agency_usr@localhost;
SELECT user, host, authentication_string FROM mysql.user WHERE user LIKE 'travel%';

-- Назначение привилегий
 GRANT SELECT, DELETE ON travel_agency.client TO travel_agency_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;

-- Проверка привилегий
SHOW GRANTS FOR travel_agency_usr@localhost;
