/* Создать пользователя и дать ему возможность удалять данные в таблице Претендент. */

-- Создание пользователя с паролем
CREATE USER employment_service_usr@localhost;

-- Выдача привилегий
GRANT DELETE ON employment_service.candidate TO employment_service_usr@localhost;
FLUSH PRIVILEGES;
