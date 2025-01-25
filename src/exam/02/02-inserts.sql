/* Заполнить таблицы данными. */

INSERT INTO education(title) VALUES ('высшее'), ('среднее');

INSERT INTO specialty(title) VALUES
    ('инженер'),
    ('слесарь'),
    ('электрик'),
    ('каменщик'),
    ('разнорабочий'),
    ('контролер')
;

INSERT INTO worker(full_name, birth_date, education_id, gender, grade, start_date, workshop_number, bonus, specialty_id) VALUES
    ('Иванов Иван Иваныч', '1985-01-15', 1, 'м', 5, '1993-06-01', 1, 1000.00, 1),
    ('Петров Петр Петрович', '2005-02-03', 2, 'м', 1, '2023-05-06', 2, 100.00, 4),
    ('Сидорова Мария Петровна', '1990-02-20', 2, 'ж', 4, '2012-03-15', 2, 800.00, 2),
    ('Смирнов Сергей Викторович', '2005-01-01', 1, 'м', 2, '2025-01-01', 3, 850.00, 4),
    ('Брынских Лариса Дмитриевна', '2006-09-06', 1, 'ж', 3, '2016-06-29', 1, 550.00, 6),
    ('Рыбаков Варфоломей Изотович', '1984-06-26', 2, 'м', 6, '1998-07-16', 1, 1540.00, 2),
    ('Борисов Творимир Ерофеевич', '1987-07-22', 2, 'м', 4, '2001-08-08', 1, 1160.00, 3),
    ('Назаров Григорий Димитриевич', '1959-05-13', 2, 'м', 5, '1993-06-30', 1, 1760.00, 3)
;
