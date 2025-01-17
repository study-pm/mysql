/* Создание уникального индекса для таблицы БРОНИ */

CREATE INDEX enter_date ON reservation (enter_date DESC);

CREATE INDEX leave_date ON reservation (leave_date DESC);
