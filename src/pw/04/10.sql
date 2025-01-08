-- Добавить в таблицу clients внешний ключ id_d c ON UPDATE RESTRICT.

ALTER TABLE clients
    ADD id_d INT UNSIGNED,
    ADD FOREIGN KEY (id_d) REFERENCES ctrana(id_c) ON UPDATE RESTRICT
;
