-- Добавить простой индекс для поля age и поставить его перед полем name.

ALTER TABLE clients
    ADD INDEX (age),
    MODIFY COLUMN age INT AFTER id_c
;
