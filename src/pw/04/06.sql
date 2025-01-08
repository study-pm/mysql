-- Добавить ключевое поле id_c int в таблицу clients и ключевое поле id_c в таблицу ctrana.

ALTER TABLE clients ADD id_c INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST;

ALTER TABLE ctrana ADD id_c INT UNSIGNED AUTO_INCREMENT PRIMARY KEY FIRST;
