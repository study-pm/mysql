SELECT * FROM customers;

SELECT *
	FROM customers
	WHERE city = 'London' OR city = 'Berlin'
;

SELECT MAX(amt), MIN(amt), SUM(amt) FROM purchases;

SELECT DISTINCT city FROM customers;

SELECT date, SUM(amt)
	FROM PURCHESES
    GROUP BY date;

SELECT COUNT(cname) FROM customers;

SELECT cname
	FROM customers
    WHERE rating BETWEEN 100 AND 300
;
