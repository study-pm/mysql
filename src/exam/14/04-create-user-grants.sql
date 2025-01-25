/* Создать пользователя и дать ему возможность осуществлять поиск и удаление данных в таблице Сотрудник. */

-- Создать пользователя и дать ему возможность осуществлять поиск и удаление данных в таблице Автомобиль.
CREATE USER car_repair_usr@localhost IDENTIFIED BY '123';

-- Проверка успешности создания пользователя
SHOW CREATE USER car_repair_usr@localhost;
SELECT user, host, authentication_string from mysql.user WHERE user LIKE 'car_rep%';

-- Назначение привилегий
GRANT SELECT, DELETE ON car_repair.car TO car_repair_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;

-- Проверка привилегий
SHOW GRANTS FOR car_repair_usr@localhost;
