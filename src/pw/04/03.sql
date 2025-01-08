-- Добавить уникальный индекс для поля telephon и простой индекс для поля age.

ALTER TABLE clients
    ADD UNIQUE INDEX (telephon),
    ADD INDEX (age)
;
