/* Создать пользователя и дать ему возможность осуществлять изменение данных в таблице Водитель. */

-- Создание пользователя с паролем
CREATE USER car_trips_user@localhost IDENTIFIED BY '123';

-- Выдача привилегий
GRANT UPDATE ON car_trips.driver TO car_trips_user@localhost;
FLUSH PRIVILEGES;
