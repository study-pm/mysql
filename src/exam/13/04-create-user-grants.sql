/* Создать пользователя и дать ему возможность осуществлять поиск и удаление данных в таблице Сотрудник. */

-- Создание пользователя с паролем
CREATE USER company_assignments_usr@localhost IDENTIFIED BY '123';

-- Проверка успешности создания пользователя
SHOW CREATE USER company_assignments_usr@localhost;
SELECT user, host, authentication_string FROM mysql.user WHERE user LIKE 'company%';

-- Назначение привилегий
GRANT SELECT, DELETE ON company_assignments.assignee TO company_assignments_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;

-- Проверка привилегий
SHOW GRANTS FOR company_assignments_usr@localhost;
