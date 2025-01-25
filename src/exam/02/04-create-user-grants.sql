/* Создать пользователя и дать ему возможность просматривать таблицу Образование. */

-- Создание пользователя с паролем
CREATE USER workers_specialization_user@localhost IDENTIFIED BY '123';

-- Выдача привилегий
GRANT SELECT ON workers_specialization.education TO workers_specialization_user@localhost;
FLUSH PRIVILEGES;
