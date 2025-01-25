-- а) Вывести гос. номер машин марки Мерседес с годом выпуска 2015 и 2018 водители которых имеют стаж работы в пределах от 5 до 10 лет. Отсортировать по убыванию года выпуска.
SELECT DISTINCT
    license_plate AS Номер,
    manufacture_year AS "Год выпуска",
    full_name AS Водитель,
    experience AS Стаж
    FROM car_trips.trip t
        JOIN car c ON t.car_id = c.id
        JOIN brand b ON b.id = c.brand_id
        JOIN driver d ON d.id = c.driver_id
    WHERE b.title = "Mercedes-Benz"
        AND manufacture_year IN ('2015', '2018')
        AND experience BETWEEN 5 AND 10
    ORDER BY manufacture_year
;

-- б) Вывести ФИО водителей, дату выезда, дату и пункт назначения, а также пробег, который водитель сделал в поездке в том случае, если средний начальный пробег машин менее 100000 км.
SELECT
    full_name AS "ФИО",
    departure_date AS "Дата выезда",
    return_date AS "Дата возвращения",
    s.title AS "Пункт назначения",
    final_mileage - initial_mileage AS "Пробег в поездке"
    FROM trip t
        JOIN car c ON t.car_id = c.id
        JOIN driver d ON c.driver_id = d.id
        JOIN station s ON t.destination_id = s.id
    WHERE (SELECT AVG(initial_mileage) FROM trip) < 100000
;

-- в) Изменить начальный пробег, увеличив его на 1000 км у машин 2010 года выпуска.
UPDATE
    trip t JOIN car c ON t.car_id = c.id
    SET initial_mileage = initial_mileage + 1000
    WHERE manufacture_year = '2010'
;

-- г) Удалить водителей со стажем работы 3 года.
DELETE
    FROM driver WHERE experience = 3;
