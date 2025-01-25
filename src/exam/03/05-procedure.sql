/* Создать хранимую процедуру для вывода данных об оплате туристами, занимающимися у определенного тренера. ФИО тренера вводить как параметр. */

DELIMITER //

CREATE PROCEDURE GetTouristPaymentByCoach(IN coach_name VARCHAR(127), OUT paid_amt DECIMAL(10, 2))
BEGIN

    -- Get coach id by coach_name
    
    -- Get total payment amount
    SELECT SUM(amount) INTO paid_amt
        FROM tourist t
            JOIN coach c ON t.coach_id = c.id
            JOIN payment p ON p.tourist_id = t.id
        WHERE c.full_name = coach_name
    ;

    -- Return tourist payment details
    SELECT
        t.full_name AS ФИО,
        MONTH(payment_month) AS Месяц,
        amount AS Сумма
        FROM tourist t JOIN coach c ON t.coach_id = c.id
        JOIN payment p ON p.tourist_id = t.id
        WHERE c.full_name = coach_name
    ;

    -- Return totals row if needed (optional)
    SELECT 'ИТОГО' AS ФИО, NULL AS Месяц, paid_amt AS Сумма;

END//

DELIMITER ;

CALL GetTouristPaymentByCoach('Сысоева Илена Романовна', @amt);

SELECT @amt AS `Общий платеж`;

DELIMITER //

CREATE PROCEDURE GetTouristPaymentByCoach()
BEGIN

    SELECT
        t.full_name AS ФИО,
        MONTH(payment_month) AS Месяц,
        amount AS Сумма
        FROM tourist t JOIN coach c ON t.coach_id = c.id
        JOIN payment p ON p.tourist_id = t.id
        WHERE c.full_name = 'Сысоева Илена Романовна'
    ;

END//

DELIMITER ;

CALL GetTouristPaymentByCoach();

SELECT @amt AS `Общий платеж`;
