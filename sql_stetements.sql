SELECT first_name,last_name, email 
FROM customer;

SELECT DISTINCT rating 
FROM film;

SELECT email 
FROM customer 
WHERE first_name ='Nancy' 
AND last_name='Thomas';

SELECT description 
FROM film 
WHERE title='Outlaw Hanky';

SELECT phone 
FROM address 
WHERE address='259 Ipoh Drive' 
OR address2='259 Ipoh Drive';

SELECT customer_id 
FROM payment
ORDER BY payment_date ASC
LIMIT 10;

SELECT title,length FROM film
ORDER BY length
LIMIT 5;

SELECT COUNT(title) 
FROM film
WHERE length<=50;

SELECT COUNT(*) 
FROM payment
WHERE amount>5;

SELECT COUNT(*) 
FROM actor
WHERE first_name LIKE 'P%';

SELECT DISTINCT district
FROM address;

SELECT COUNT(*) 
FROM film
WHERE rating='R' 
AND replacement_cost BETWEEN 5 AND 15;

SELECT COUNT(*) 
FROM film
WHERE title 
LIKE '%Truman%';

