/* Создать пользователя и дать ему возможность добавлять данные в таблицу Повар. */

-- Создание пользователя с паролем
CREATE USER car_transport_usr@localhost IDENTIFIED BY '123';

-- Выдача привилегий
GRANT UPDATE ON car_transport.car TO car_transport_usr@localhost;

-- Актуализация привилегий
FLUSH PRIVILEGES;
