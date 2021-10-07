--Q1
SELECT *
FROM address;

SELECT *
FROM customer;


SELECT first_name, last_name, customer_id, address, district, postal_code
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas'
ORDER BY last_name;
--"Kim" "Cruz"
--"Jennifer" "Davis"
--"Bryan" "Hardison"
--"Richard" "Mccrary"
--"Ian" "Still"

--Q2

SELECT *
FROM customer

SELECT *
FROM payment

SELECT payment_id, amount
FROM payment
WHERE (amount)>6.99;

--Q3
SELECT *
FROM customer
WHERE customer_id IN (--start of subquery
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >175
ORDER BY SUM (amount) DESC
);




--Q4
--customer - addresss - city - country
SELECT*
FROM country

SELECT *
FROM address
ORDER BY district

SELECT first_name, last_name, address.city_id, customer.address_id, city.country_id
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country.country_id = 66;
--"Kevin" "SChuler"

--Q5
SELECT first_name, last_name, count(*)
FROM payment

SELECT payment_id COUNT(*)
FROM payment
JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY staff.staff_id;

--Q6

SELECT *
FROM film_actor

SELECT *
FROM film

SELECT *
FROM actor

SELECT title, count(*)
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY COUNT(film_actor.film_id) DESC
LIMIT 1;
-- Lambs Cincinnati





--Q7
SELECT first_name, last_name, count(*)
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY COUNT(film_actor.actor_id) ASC
LIMIT 1;

--Emily Dee


--Q8
--district(address)

SELECT district, count(*)
FROM address
GROUP BY district
HAVING COUNT(district) > 5
ORDER BY count(*) DESC
--9