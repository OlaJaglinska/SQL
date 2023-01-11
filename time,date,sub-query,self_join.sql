-- date and time
SHOW TIMEZONE;
SELECT TIMEOFDAY();

SELECT EXTRACT(YEAR FROM payment_date) 
AS pay_ear
FROM payment;

SELECT TO_CHAR(payment_date, 'DD.MM.YYYY (dy)')
FROM payment;

-- During witch months did payments occur?
SELECT DISTINCT(TO_CHAR(payment_date, 'month'))
FROM payment;

--How many payments occurred on a Monday?
SELECT COUNT(*)
FROM payment
WHERE TO_CHAR(payment_date, 'FMDay') = 'Monday';
--OR
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment.payment_date) = 1;

-- math
SELECT ROUND(rental_rate/replacement_cost,2)*100 AS percent_cost
FROM film;

-- strings
SELECT UPPER(first_name)||' '|| upper(last_name) AS full_name
FROM customer;

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com'
AS custom_email
FROM customer;

-- sub query
SELECT title,rental_rate
FROM film
WHERE rental_rate > 
(SELECT AVG(rental_rate) FROM film);

SELECT film_id,title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title;

SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment AS p
WHERE p.customer_id=c.customer_id
AND amount>11);

-- self-join
-- pair of films of the same length
SELECT f1.title,f2.title,f1.length
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id != f2.film_id
AND f1.length = f2.length