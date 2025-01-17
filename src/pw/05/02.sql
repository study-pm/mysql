/* Создание уникального индекса для таблицы КЛИЕНТЫ */

ALTER TABLE	client
	ADD INDEX (last_name),
	ADD UNIQUE INDEX (passport_number)
;
