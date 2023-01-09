SELECT staff_id, customer_id,SUM(amount)FROM payment
GROUP BY staff_id,customer_id
ORDER BY customer_id;

SELECT DATE(payment_date),SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount)DESC;

SELECT rating,ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating
ORDER BY AVG(replacement_cost);

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

SELECT customer_id,COUNT(*) FROM payment
GROUP BY customer_id
HAVING COUNT(*)>=40;

SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id=2
GROUP BY customer_id
HAVING SUM(amount)>100;

/* Return the customer IDs of customers who have spent at 
least $110 with the staff member who has an ID of 2.*/
SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id=2
GROUP BY customer_id
HAVING SUM(amount)>110;

-- How many films begin with the letter J?
SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

/*What customer has the highest customer ID number whose 
name starts with an 'E' and has an address ID lower than 500?*/

SELECT first_name,last_name, customer_id FROM customer
WHERE first_name LIKE 'E%'
AND address_ID < 500
ORDER BY customer_id DESC
LIMIT 1;