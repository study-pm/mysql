/* Создание уникального индекса для таблицы ПОСЕЛЕНИЯ */

ALTER TABLE checkin
	ADD INDEX (enter_date DESC),
	ADD INDEX (leave_date DESC)
;
