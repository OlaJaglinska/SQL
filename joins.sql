SELECT customer_id,SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;

SELECT payment_id, payment.customer_id, first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id;


--Titles not available in inventory
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory 
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null;

/* What are the emails of the customers 
who live in California?*/
SELECT email, first_name, last_name, district
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id
WHERE district = 'California';

/* Get a list of all movies 
"Nick Wahlberg" has been*/
SELECT title, first_name, last_name 
FROM film_actor
	INNER JOIN actor ON actor.actor_id = film_actor.actor_id
	INNER JOIN film ON film.film_id = film_actor.film_id
WHERE first_name='Nick' AND last_name = 'Wahlberg';