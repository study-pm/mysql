-- Переименовать поле dolgnost таблицы clients в post типа varchar(15).

ALTER TABLE clients CHANGE dolgnost post VARCHAR(15);
